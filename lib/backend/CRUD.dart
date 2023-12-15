import 'dart:ffi';

import 'package:b_im_q/backend/interceptors/dio_interceptor.dart';
import 'package:b_im_q/backend/service/DioExceptions.dart';
import 'package:b_im_q/backend/service/Store.dart';
import 'package:b_im_q/backend/users.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

class DioClient {
  String _baseUrl = "http://192.168.1.105:10012/";
  late final Dio _dio;

  DioClient(){
    _dio = Dio(
      BaseOptions(
        connectTimeout: 10000, //10 sec
        receiveTimeout: 5000, //5 sec
        // headers: {
        //   'Accept': 'application/json',
        // },
      ),
    );
    _dio.interceptors.add(DioInterceptor());
  }

  //GET Api Request
  Future<void> _saveToken(Map<String, dynamic> data) async{
    final access_token = data['access_token'];
    await Store.setToken(access_token);
  }

  Future<bool> dioLogin({required String username,required String password}) async{

    final response = await _dio.post('${_baseUrl}token',
      data: FormData.fromMap({
        'username': username,
        'password': password,
        // Add any other data you want to send in the body
      }),
    );
    if(response.statusCode == 200){
      await _saveToken(response.data);
      return true;
    }
    return false;
  }

  Future<String?> DioGetUserData() async{
    //_dio.interceptors.add(DioInterceptor());
    try{
      final response = await _dio.get('${_baseUrl}users/me/');
      if(response.statusCode == 200){
        if (kDebugMode) {
          print(response.data);
        }
        return response.data['username'];
      }
    } on DioError catch (e){
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Users?> signUpUser({required String username,required String email, required String password}) async{
    Users retrieveUser;
    final bool is_active = true;
    try {
      Response response = await _dio.post("${_baseUrl}users/",
        data: jsonEncode(<String, dynamic>{
          'username': username,
          'email': email,
          'is_active': is_active,
          'password': password,
          // Add any other data you want to send in the body
        }),
        );
      if (response.statusCode == 200) {
        // Successful POST request, handle the response here
        print('User created: ${response.data}');
        retrieveUser = Users.fromJson(response.data);
        return retrieveUser;
      }
    }on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}

// POST Api Request
Future<String?> createUser(String username, String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('http://192.168.1.77:10012/users/'),
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'email': email,
        'password': password,
        // Add any other data you want to send in the body
      }),
    );
    if (response.statusCode == 200) {
      // Successful POST request, handle the response here
      final responseData = jsonDecode(response.body);
      return 'ID: ${responseData['id']}\nUsername: ${responseData['username']}\nEmail: ${responseData['email']}\nPassword: ${responseData['password']}';
    }
  } catch (e) {
      throw('Error: $e');
  }
}

//Update Api Users
Future<Users> updateUsers(String username, String email, String password) async{
  Map<String, dynamic> request = {
    'username' : username,
    'email' : email,
    'password' : password,
    'id' : "111"
  };

  final uri = Uri.parse("https://jsonplaceholder.typicode.com/users/1");
  final response = await http.put(uri, body: request);

  if (response.statusCode == 200){
    return Users.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Failed to load user data');
  }
}
