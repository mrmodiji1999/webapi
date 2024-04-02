import 'package:equatable/equatable.dart';
import 'package:webkul1/model/post_data_model.dart';
import 'package:webkul1/repo/post_status.dart';

class FlutterState extends Equatable{
  String message;
  bool isScaffold;
  bool IsviewList;
  String Email ;
  String Passwd;
  PostStatus postStatus;
  List<Welcome> postlist ;
  FlutterState({this.Email ='empty',this.Passwd ='empty' , this.isScaffold=false,this.IsviewList=false,this.message='',this.postStatus=PostStatus.Loding,this.postlist=const <Welcome>[]});
  FlutterState copyWith({ String? message, bool? isScaffold,
  PostStatus? postStatus,bool? IsviewList,  String? Email ,
  String? Passwd,
  List<Welcome>? postlist }){
 print('[][][][][][]]$Email $Passwd');


    return FlutterState(
      Email: Email??this.Email,
Passwd: Passwd?? this.Passwd,
      isScaffold: isScaffold??this.isScaffold,
      IsviewList: IsviewList ?? this.IsviewList,
      postStatus: postStatus ??this.postStatus,
      message: message??this.message,
      postlist: postlist ?? this.postlist,

    );
  }
  @override

  List<Object?> get props =>[IsviewList,isScaffold,Email,Passwd,postStatus,message,postlist];
}