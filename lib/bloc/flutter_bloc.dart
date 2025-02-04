import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:webkul1/bloc/flutter_event.dart';
import 'package:webkul1/bloc/flutter_state.dart';
import 'package:webkul1/repo/dio.dart';
import 'package:webkul1/repo/post_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterBloc extends Bloc<FlutterEvent, FlutterState> {
  // postrepo postrepoo = postrepo();

  FlutterBloc() : super(FlutterState()) {
    on<PostFetchEvent>(postFetchEvent);
        on<ViewEvent>(viewEvent);
        on<ScaffoldEvent>(scaffoldEvent);
        
        on<ApiDataSendEvent>(apiDataSendEvent);

  }

  FutureOr<void> postFetchEvent(

      PostFetchEvent event, Emitter<FlutterState> emit) async{
        SharedPreferences sp =await SharedPreferences.getInstance();
print('????????????????????????????????');
 print( sp.getBool('isScaffold')??state.isScaffold);
 print( sp.getBool('IsviewList')??state.IsviewList);
        print('????????????????????????????????');
        print('post fetch event method ');
 await PostsRepo.fetchPosts(event.cate).then((value) => 

 emit(state.copyWith(
      postStatus:  PostStatus.Succes,
      message: 'success',
      
      isScaffold: sp.getBool('isScaffold')??state.isScaffold,
      IsviewList: sp.getBool('IsviewList')??state.IsviewList,

      postlist: value


      


    ))).onError((error, stackTrace) => emit(state.copyWith(message: 'fail',postStatus: PostStatus.Failuer)));
 
  }

  FutureOr<void> viewEvent(ViewEvent event, Emitter<FlutterState> emit)async {
    
        SharedPreferences sp =await SharedPreferences.getInstance();
sp.setBool('IsviewList', !state.IsviewList);
emit(state.copyWith(IsviewList: !state.IsviewList));
  }

  FutureOr<void> scaffoldEvent(ScaffoldEvent event, Emitter<FlutterState> emit) async{
    
        SharedPreferences sp =await SharedPreferences.getInstance();
sp.setBool('isScaffold', !state.isScaffold);
    emit(state.copyWith(isScaffold: !state.isScaffold,));
  }


  FutureOr<void> apiDataSendEvent(ApiDataSendEvent event, Emitter<FlutterState> emit) async{
   print('event value posrrepo k addpost m bj di gei h');
    final value=await PostsRepo.addPost(event.Email ,  event.Password);
  
    print('i am showing response of api addpost ${value.toString()}');
    emit(state.copyWith(Email:event.Email ,Passwd: event.Password));




  }
}

