import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/fire_base.dart';
import 'package:todo/list_provider.dart';

import 'Todo.dart';
import 'mythemeData.dart';

class TodoListTab extends StatelessWidget {
 Todo todo;
 TodoListTab(this.todo);
 late
 ListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    return Slidable(
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

 

        // All actions are defined in the children parameter.
        children:  [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context){
              deleteTodo();
              print('delete clicked');
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
      ],
      ),

      child: Container(
        height: MediaQuery.of(context).size.height * .12,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 4,
              color: Theme.of(context).primaryColor,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title!,
                  style: TextStyle(
                      color: MyThemeData.primarycolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),

                Text('${todo.description!}' )
              ],
            ),
            const Spacer(
              flex: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(12))),
              padding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
  void deleteTodo(){
    getCollectionRef().doc(todo.id).delete().onError((error, stackTrace){
      print('TodoList#deleteTodo:error is $error');
    })
        .timeout(Duration(milliseconds: 500),onTimeout:(){
      print('TodoList#deleteTodo:error is');
      provider.refreshTodo();

    } );
  }
}
