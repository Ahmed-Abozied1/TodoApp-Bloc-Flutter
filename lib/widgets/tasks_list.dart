import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/bloc/tasks_bloc.dart';
import 'package:todo_bloc/models/tasks.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];
            return ListTile(
                title: Text(task.title),
                trailing: IconButton(
                  onPressed: () {
                    context.read<TasksBloc>().add(DeleteTask(task: task));
                  },
                  icon:const Icon(Icons.delete),
                  color: Theme.of(context).primaryColor,
                ));
          }),
    );
  }
}
