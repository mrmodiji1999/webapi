import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

 abstract class FlutterEvent extends Equatable{
  @override
  List<Object?> get props =>[];

}
class PostFetchEvent extends FlutterEvent{
final int? cate;
PostFetchEvent({required this.cate});

}

class ViewEvent extends FlutterEvent{}
class ScaffoldEvent extends FlutterEvent{}
class ApiDataSendEvent extends FlutterEvent{String Email, Password;

ApiDataSendEvent({required this.Email,required this.Password});
}