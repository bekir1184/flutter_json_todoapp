class Todo{
  int id;
  int userId;
  bool completed ;
  String title ;

  Todo(int id , int userId ,bool completed , String title){
    this.id = id;
    this.userId =userId;
    this.title =title;
    this.completed =completed;
  }
  //Json nesnesini to do nesnesine cevirecegis
  Todo.fromJson(Map json){
    id = json["id"];
    userId = json["userId"];
    completed =json["completed"];
    title = json["title"];
    if(title.length > 50){
      title = title.substring(0,50);
    }
  }

  Map toJson(){
    return {"id": id , "userId":userId ,"completed":completed ,"title":title} ;
  }
}
