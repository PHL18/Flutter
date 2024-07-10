import 'package:hive/hive.dart';

class TodoDatabase{
  //reference box

  List todoList=[];
  final _mybox=Hive.box("mybox");
  //run this method for opening the app for the first time
  void createInitialData(){
    todoList=[
      ["Make Tutorial",false],
      ["Get Groceries",false],
      ];
  }
  //load the data from the database
  void loaddata()
  { 
    todoList=_mybox.get("TODOLIST");
  }
  void updatedatabase(){
    _mybox.put("TODOLIST",todoList);
  }
}