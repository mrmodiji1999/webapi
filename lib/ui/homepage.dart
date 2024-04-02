import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkul1/bloc/flutter_bloc.dart';
import 'package:webkul1/bloc/flutter_event.dart';
import 'package:webkul1/bloc/flutter_state.dart';
import 'package:webkul1/repo/post_status.dart';
import 'package:webkul1/ui/FormInput.dart';

class PostDataPage extends StatefulWidget {
  const PostDataPage({super.key});

  @override
  State<PostDataPage> createState() => _PostDataPageState();
}

class _PostDataPageState extends State<PostDataPage> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FlutterBloc>().add(PostFetchEvent(cate: 6));
  }
 int _selectedValue = 3; 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlutterBloc, FlutterState>(
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: FilledButton(
                onPressed: () {
                  context.read<FlutterBloc>().add(ViewEvent());
                },
                child: Icon(Icons.add)),

            backgroundColor:state.isScaffold ? Colors.blue:Colors.yellow,
            appBar: AppBar(backgroundColor:Colors.transparent,
              actions: [DropdownButton<int>(
      value: _selectedValue,
    onChanged: (int? newValue) {
  context.read<FlutterBloc>().add(PostFetchEvent(cate: newValue));
  setState(() {
    
  });
},

      items: List.generate(
        5,
        (index) => DropdownMenuItem<int>(
          value: index + 1,
          child: Text((index + 1).toString()), // Display integer value
        ),
      ),
    ),
                IconButton(onPressed: () {
                  context.read<FlutterBloc>().add(ScaffoldEvent());
                }, icon:state.isScaffold? Icon(Icons.lightbulb,color: Colors.yellow,):Icon(Icons.lightbulb))
              ],title:TextField(onChanged: (value) {
                setState(() {
                  
                });
              },decoration: InputDecoration(label: Text('search hear your data item')),controller: search,),
              leading:IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataSendClass()));
}, icon: Icon(Icons.add)),
            ),
            body: BlocBuilder<FlutterBloc, FlutterState>(
                builder: (context, state) {
              switch (state.postStatus) {
                case PostStatus.Failuer:
                  return Text('fail');
                case PostStatus.Loding:
                  return Center(child: CircularProgressIndicator());
                case PostStatus.Succes:
                  print('homepage data reach saucces>>>>>>>>>>>');
                  // print(state.postlist.length);
                  // print(state.postlist[0].id);
                  // print("""end""");
                  int lengthValue = 6;
                  // print(lengthValue);
                  print("""the end""");
                  if (state.IsviewList) {                                    
                    return GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(lengthValue, (index) {
                           final item = state.postlist[index];
                        print('ooooooooooooooooo');
                        return Center(
                          child: Column(
                            children: [
                              Text(
                                'item.description.toString()',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text('item.price.toString()')
                            ],
                          ),
                        );
                      }),
                    );
                  } else {print('narendra1');
                    return ListView.builder(
                        itemCount:lengthValue,
                        itemBuilder: (context, index) {
                          //  final item = state.postlist[index];
                          // String name = item.title.toString();
                        if(search.text.isEmpty){ return ListTile(
                              leading: Text(index.toString()),
                              title: Text('item.title.toString()'),
                              subtitle: Text('item.description.toString()'));}
                              
//                               else if(
// name.toLowerCase().contains(search.text.toLowerCase())
//                               )
                              
//                               { return ListTile(
//                               leading: Text(index.toString()),
//                               title: Text(item.title.toString()),
//                               subtitle: Text(item.updatedAt.toString()));}
                              
                              
                              else{Container();}
                         
                        });
                  }
              }
            }));
      },
    );
  }
}
