// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/bloc/tasks_bloc.dart';
import 'package:todo_bloc/models/tasks.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
   AddTaskScreen({
    Key? key, 
  }) : super(key: key);
  TextEditingController titlecontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Add Task",
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            autofocus: true,
            controller: titlecontroller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text("Enter title")),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:const Text("cancel")),
              TextButton(
                  onPressed: () {
                    var task = Task(title: titlecontroller.text);
                    context.read<TasksBloc>().add(AddTask(task: task));
                    titlecontroller.text = "";
                    Navigator.pop(context);
                  },
                  child:const Text("Ok")),
            ],
          )
        ],
      ),
    );
  }
}


