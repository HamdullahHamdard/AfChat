class ChatUser {
  late String uid;
  late String name;
  late String email;
  late String imageURL;
  late DateTime lastActive;

  ChatUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageURL,
    required this.lastActive,
  });

  factory ChatUser.fromJSON(Map<String, dynamic> _json) {
    return ChatUser(
      uid: _json["uid"],
      name: _json["name"],
      email: _json["email"],
      imageURL: _json["imageURL"],
      lastActive: _json["lastActive"].toDate(),
    );
  }
  Map<String, dynamic> toMap(){
    return {
      "email": email,
      "name": name,
      "image": imageURL,
      "last_active": lastActive,
    };
  }
  String lastDayActive(){
    return "${lastActive.month}/${lastActive.day}/${lastActive.year}";
  }

  bool wasRecentlyActive(){
    return DateTime.now().difference(lastActive).inHours <2;
  }
}
