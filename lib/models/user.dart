class KeppUser {
  String name;
  String avatarImage;

  KeppUser({this.name, this.avatarImage});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatarImage': avatarImage,
    };
  }

  factory KeppUser.fromJson(Map<String, dynamic> json) {
    return KeppUser(
      name: json['name'],
      avatarImage: json['avatarImage'],
    );
  }
}
