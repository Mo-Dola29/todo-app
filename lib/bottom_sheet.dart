import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Todo.dart';
import 'package:todo/fire_base.dart';
import 'package:todo/list_provider.dart';

class AddBottomSheet extends StatefulWidget {

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
   String title='';

    String description='';

    DateTime selectedDate=DateTime.now();
    GlobalKey<FormState>key=GlobalKey<FormState>();
   late ListProvider provider;
  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    return Container(
      margin: EdgeInsets.all(18),
      child: Form(
        key:key ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
              Text('Add your task',textAlign: TextAlign.center,style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold),),
            Spacer(),
            TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (text){
                title=text;
              },
              decoration:
              InputDecoration(
                label: Text('Title',style: TextStyle(),),

              ),


            ),
            Spacer(),
            TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (text){
                description=text;
              },
              decoration: const InputDecoration(
                label: Text('description'),

              ),
            ),
            Spacer(),
            Text('Select time',style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold),),
            Spacer(),

            InkWell(
                onTap: (){ShowMyDatePicker();},
                child: Center(child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'))),
            Spacer(),

            Container(
              width: MediaQuery.of(context).size.width*.8,
              child: ElevatedButton(onPressed: (){AddTask();}, child: Text('Add')

               ),
            ),
            Spacer(),


          ],
        ),
      ),
    );
  }
   void ShowMyDatePicker() async{
    DateTime?newDate= await showDatePicker(context: context,
         initialDate: selectedDate, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365))

     );
    selectedDate=newDate==null?selectedDate:newDate;
     setState(() {

     });
   }

   void AddTask() {
   if(!key.currentState!.validate()) return;
      CollectionReference<Todo> todosRef=getCollectionRef();

      var todoDocument=todosRef.doc();
      Todo todo =Todo(todoDocument.id, title, description, selectedDate.microsecondsSinceEpoch);
      todoDocument.set(todo).then((_){
        Navigator.pop(context);
        print('AddBottomSheet#AddTask:added task successfully');
      }).onError((error, stackTrace){
        print('AddBottomSheet#AddTask:error occurred $error');
      }).timeout(Duration(milliseconds: 500),onTimeout:() {
        provider.refreshTodo();
        Navigator.pop(context);
   });
   }
}


