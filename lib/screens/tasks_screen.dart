// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/bloc/tasks_bloc.dart';
import 'package:todo_bloc/models/tasks.dart';
import 'package:todo_bloc/screens/add_Screen.dart';
import 'package:todo_bloc/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});
  void addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Todo App"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Center(
                child: Chip(
                  label: Text("Tasks"),
                ),
              ),
              TaskList(tasksList: tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                addTask(context);
              },
              label:const Text("Add Task")),
        );
      },
    );
  }
}
