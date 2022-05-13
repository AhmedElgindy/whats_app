class StatusModel{
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? statusImage;
  String? text;
  int? day;
  String? time;

  StatusModel({
    this.uId,
    this.name,
    this.statusImage,
    this.image,
    this.text,
    this.dateTime,
    this.day,
    this.time
  });
  StatusModel.fromJson(Map<String,dynamic>json){
    statusImage=json['statusImage'];
    text=json['text'];
    uId=json['uId'];
    name=json['name'];
    dateTime = json['dateTime'];
    image =json['image'];
    day =json['day'];
    time =json['time'];
  }
  Map<String,dynamic>toMap(){
    return{
      'name':name,
      'dateTime':dateTime,
      'text':text,
      'uId':uId,
      'statusImage':statusImage,
      'image':image,
      'day':day,
      'time':time,
    };
  }
}