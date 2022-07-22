class UserModel {
  String? name;
  String? phone;
  String? uId;
  String? email;
  String? image;
  String? bio;
  DateTime? lastMessageTime;

  UserModel({
    this.uId,
    this.email,
    this.phone,
    this.name,
    this.image,
    this.bio,
    this.lastMessageTime,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    name = json['name'];
    image = json['image'];
    bio = json['bio'];
    lastMessageTime = json['lastMassageTime'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'image': image,
      'bio': bio,
      'lastMassageTime': lastMessageTime,
    };
  }
}

class UserField {
  static const String lastMessageTime = 'lastMessageTime';
}
