import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webkul1/model/post_data_model.dart';
import 'package:webkul1/repo/posts_service.dart';

class PostsRepo {


  static Future<List<Welcome>> fetchPosts(int? cate) async {
    final dio = Dio();
    final postsService = PostsService(dio);
print('cate value showing to user ${cate}');
String accessToken ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTcxMTk5ODUyNCwiZXhwIjoxNzEzNzI2NTI0fQ.fi7eqw-Hn8IwR4WjVGBw3tGHE2Fxxu_PYL3fmTD7Rgc","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTcxMTk5ODUyNCwiZXhwIjoxNzEyMDM0NTI0fQ.v6IIC6RBjbtLWzBbUVa6qc2kMvT5Z1ejtpBlDVD6afY';
    try {
      final dynamic responseData = await postsService.fetchMoreProducts(cate, 'Bearer $accessToken');
print('????outer response = >>> $responseData');
      if (responseData is List) {
        print('data in listform>>>>>>> ${responseData}');
   
        return responseData
            .map((data) => 
            
            Welcome.fromJson(data))
            .toList();
      } else if (responseData is Map<String, dynamic>) {
        print('data in objectfrom ${responseData}');
       
        return [Welcome.fromJson(responseData)];
      } else {
        log('Unexpected response format: $responseData');
        return [];
      }
    } catch (e) {
      log('Error fetching posts: $e');
      return [];
    }




    
  }

  





  // static Future<bool> addPost(String name ,passwd) async {
  //     final dio = Dio();
  //     print('add post se $name $passwd');
  //   final postsService = PostsService(dio);

  //   try {
  //     final headers = {
  //       'Content-Type': 'application/json',
  //     };

  //     final body = {
  //       "email": name,
  //       "password": passwd,
  //     };

  //     final response = await dio.post(
  //     base_Urlpp,
  //       options: Options(headers: headers),
  //       data: body,
  //     );print('i am from dio post method $response');

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       print(response);
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     log('Error adding post: $e');
  //     return false;
  //   }
  // }

  
  static Future<dynamic> addPost(String name ,passwd) async {
  final dio = Dio();
  final postsService = PostsService(dio);

// try {
//   final body = {
//     "email": "john@mail.com",
//     "password": "changeme"
//   };

//   final response = await postsService.addPost(body);

//   if (response is Map && response.containsKey('access_token')) {
//     final accessToken = response['access_token'];
    
//     // Now you can use the access token for authenticated requests
//     // For example:
//     // final postsResponse = await postsService.getPosts(accessToken);
    
//     return true; // Assuming success
//   } else {
//     print('Failed to obtain access token');
//     return false;
//   }
// } catch (e) {
//   print('Error adding post: $e');
//   return false;
// }}



  
    final body = {
     "email": "john@mail.com",
  "password": "changeme"
    };
    // final contentType = 'application/json';
    // final authorization = 'Bearer your_access_token'; 

    final response = await postsService.addPost(body/* contentType, authorization*/);
    
print("""""""""""""""""""""""""""object""""""""""""""""""""""""""");
   print('>>>>>>>>>>>>>>>>>>>>>>  $response ');
print("""""""""""""""""""""""""""object""""""""""""""""""""""""""");
print(response['access_token']);
    
 
  
    return response;
  }
}

