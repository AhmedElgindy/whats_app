class MessageModel {
  String? reciverId;
  String? senderId;
  String? dataTime;
  String? text;

  MessageModel({
    this.reciverId,
    this.senderId,
    this.dataTime,
    this.text,
  });
  MessageModel.fromJson(Map<String, dynamic> json) {
    reciverId = json['reciverId'];
    senderId = json['senderId'];
    dataTime = json['dataTime'];
    text = json['text'];
  }
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'reciverId': reciverId,
      'senderId': senderId,
      'dataTime': dataTime,
    };
  }
}
