
class Todo{
  String? id;
  String? title;
  String? description;
  int? dateTime;
  Todo(this.id,this.title,this.description,this.dateTime);

  Todo.fromJson(Map<String, Object?> json){
    title= json['title']! as String;
    id= json['id']! as String;
    description=json['description']! as String;
    dateTime=json['dateTime']! as int;
  }



  Map<String,Object?>toJson(){
  return{
    'id':id,
    'title':title,
    'description':description,
    'dateTime':dateTime
  };
}
}