import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project_to_do/data/database.dart';
import 'package:project_to_do/util/dialog_box.dart';
import 'package:project_to_do/util/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of todo tasks
final _controller=TextEditingController();
  // List todoList=[
  //   ["Make tutorial",false],
  //   ["Do Excercise",false],
    

  // ];
  final _mybox=Hive.box("mybox");
  TodoDatabase db=TodoDatabase();
  @override
  void initState()
  {
    //if this is the first time time opening the app then create default box 
    if(_mybox.get("TODOLIST")==null)
    {
      db.createInitialData();
    }
    else{
      db.loaddata();
    }
    super.initState();
  }
  void checkboxchanged(bool value,int index)
  {
    setState(() {
      db.todoList[index][1]=! db.todoList[index][1];
    });
    db.updatedatabase();
  }
  void savenewtask()
  {
    setState(() {
     db.todoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
      db.updatedatabase();
  }
  void createNewTask()
  {
    showDialog(context: context, builder: (context){
     return DialogBox(
      controller:_controller ,
      onSave: savenewtask,
      onCancel: (){
        Navigator.of(context).pop();
      },
     );
    });
  }
  void deleteTask(int index)
  {
    setState(() {
      db.todoList.removeAt(index);
    });
      db.updatedatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("To-Do-App")
      ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          createNewTask();
        },
        child:Icon(Icons.add),
        backgroundColor: Colors.yellow,
        ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context,index){
            return ToDoTile(
              taskname: db.todoList[index][0],
               taskcompleted: db.todoList[index][1], 
               onChanged: (value)=> checkboxchanged(value!,index),
               deletefunction:(context)=> deleteTask(index),
              
               
              
               );
          },

        // children: [

        //   // ToDoTile(
        //   //   taskname: "Make Tutorial",
        //   //   taskcompleted: true,
        //   //   onChanged: (p0){},
        //   // ),
        //   // ToDoTile(
        //   //   taskname: "Do Homework",
        //   //   taskcompleted: false,
        //   //   onChanged: (p0){},
        //   // ),
        // ],
      ),
    );
  }
}