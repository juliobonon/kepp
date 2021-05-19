class KeyboardBuild {
  String name;
  String userUid;
  String keyboardswitch;
  String keycap;
  String pcb;
  String keyboardcase;

  KeyboardBuild(
      {this.name,
      this.userUid,
      this.keyboardswitch,
      this.keycap,
      this.pcb,
      this.keyboardcase});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'userUid': userUid,
      'keyboardswitch': keyboardswitch,
      'keycap': keycap,
      'pcb': pcb,
      'keyboardcase': keyboardcase,
    };
  }

  factory KeyboardBuild.fromJson(Map<String, dynamic> json) {
    return KeyboardBuild(
        name: json['name'],
        userUid: json['userUid'],
        keyboardswitch: json['switch'],
        keycap: json['keycap'],
        pcb: json['PCB'],
        keyboardcase: json['case']);
  }
}
