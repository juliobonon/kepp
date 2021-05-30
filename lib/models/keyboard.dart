class KeyboardBuild {
  String buildID;
  String name;
  String userUid;
  String keyboardswitch;
  String keycap;
  String pcb;
  String keyboardcase;
  List<String> favorites;
  String id;

  KeyboardBuild({
    this.buildID,
    this.name,
    this.userUid,
    this.keyboardswitch,
    this.keycap,
    this.pcb,
    this.keyboardcase,
    this.favorites,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'buildID': buildID,
      'name': name,
      'userUid': userUid,
      'keyboardswitch': keyboardswitch,
      'keycap': keycap,
      'pcb': pcb,
      'keyboardcase': keyboardcase,
      'favorites': favorites,
    };
  }

  factory KeyboardBuild.fromJson(Map<String, dynamic> json, String id) {
    return KeyboardBuild(
      id: id,
      buildID: json['buildID'],
      name: json['name'],
      userUid: json['userUid'],
      keyboardswitch: json['switch'],
      keycap: json['keycap'],
      pcb: json['PCB'],
      keyboardcase: json['case'],
      favorites: json['favorites'] == null
          ? []
          : json["favorites"].map<String>((i) => i as String).toList(),
    );
  }
}
