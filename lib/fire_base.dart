

import 'package:cloud_firestore/cloud_firestore.dart';

import 'Todo.dart';


CollectionReference<Todo> getCollectionRef(){
  CollectionReference<Todo> todoCollection=FirebaseFirestore.instance.collection('todos').withConverter<Todo>(
    fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
    toFirestore: (todo, _) => todo.toJson(),
  );
  return todoCollection;
}