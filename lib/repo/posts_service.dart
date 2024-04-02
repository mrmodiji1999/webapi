import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'posts_service.g.dart';
@RestApi(baseUrl: "https://api.escuelajs.co/api/v1/auth")
abstract class PostsService {
  factory PostsService(Dio dio) = _PostsService;
  @GET("auth/profile")
  Future<dynamic> fetchMoreProducts(
    @Query("p") int? categoryId,
    
    @Header("Authorization") String authorization, 
  
  );
 @POST("/login")
  Future<dynamic> addPost(
    @Body() Map<String, dynamic> postData,
   // @Header("Content-Type") String contentType,
  //  @Header("Authorization") String authorization,
  );
}

