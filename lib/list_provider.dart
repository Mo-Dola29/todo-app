import 'package:flutter/cupertino.dart';

import 'Todo.dart';
import 'fire_base.dart';

class ListProvider extends ChangeNotifier{
  List<Todo>items=[];
  DateTime selectedDay = DateTime.now();
  void refreshTodo(){
    var todoRef=getCollectionRef();
    todoRef.get().then((snapShot){
      //for(int i=0;i<snapShot.docs.length;i++) {
      //items.add(snapShot.docs[0].data());
      //}
      items=snapShot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
    items=items.where((todo){
      DateTime todoDateTime=DateTime.fromMillisecondsSinceEpoch(todo.dateTime!);
      return _isSameDate(todoDateTime, selectedDay);

    }).toList( );
notifyListeners();
  }
  void setSelectedDay(DateTime newDate){
    selectedDay=newDate;
    notifyListeners();
  }
  bool _isSameDate( DateTime date1,DateTime date2){
    return date1.year==date2.year&&date1.month==date2.month&&date1.day==date2.day ;
  }
}