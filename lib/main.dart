import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todoapp_json/models/todo.dart';

import 'apis/api.dart';

void main() =>runApp(TodoApp());

class TodoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: TodoListApp (

        ),
    );
  }

}

class TodoListApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  =>TodoListAppState();
}

class TodoListAppState extends State<TodoListApp> {
  List<Todo> list = new List<Todo>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(27, 38, 44, 1) ,
        brightness: Brightness.light,
        title: Text("Yapilacaklar Listesi" ,style: TextStyle(color: Colors.white ,fontSize: 25),),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder:(context,position){
            return Container(
              padding: EdgeInsets.all(19),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color:Color.fromRGBO(0, 183, 194, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      list[position].completed ? Icons.check_circle : Icons.check_circle_outline ,
                      color: list[position].completed ? Color.fromRGBO(253, 203, 185, 1) : Colors.white,
                    ),
                    onPressed: (){
                      setState(() {
                        if(list[position].completed){
                          list[position].completed = false ;
                        }else{
                          list[position].completed = true ;
                        }
                      });
                    },
                    iconSize: 30,
                  ),
                  SizedBox(width: 5,),
                  Text(list[position].title,style: TextStyle(fontSize: 17 ,color: Colors.white),),
                ],
              ),

            );

          },
          itemCount: list.length,
        ),
      )
    );
  }

  getTodos(){
    Api.getTodos().then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        this.list =list.map((todo)=>Todo.fromJson(todo)).toList();

      });
    });
  }



  @override
  void initState() {
    super.initState();
    getTodos();
  }

}
/*

*/