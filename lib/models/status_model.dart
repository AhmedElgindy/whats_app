class StatusModel{
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? statusImage;
  String? text;

  StatusModel({
    this.uId,
    this.name,
    this.statusImage,
    this.image,
    this.text,
    this.dateTime,
  });
  StatusModel.fromJson(Map<String,dynamic>json){
    statusImage=json['statusImage'];
    text=json['text'];
    uId=json['uId'];
    name=json['name'];
    dateTime = json['dateTime'];
    image =json['image'];
  }
  Map<String,dynamic>toMap(){
    return{
      'name':name,
      'dateTime':dateTime,
      'text':text,
      'uId':uId,
      'statusImage':statusImage,
      'image':image,
    };
  }
}