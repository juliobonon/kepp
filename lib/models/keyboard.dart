class KeyboardBuild {
  String name;

  String keyboardswitch;
  String keycap;
  String pcb;
  String keyboardcase;

  KeyboardBuild(
      {this.name,
      this.keyboardswitch,
      this.keycap,
      this.pcb,
      this.keyboardcase});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'keyboardswitch': keyboardswitch,
      'keycap': keycap,
      'pcb': pcb,
      'keyboardcase': keyboardcase,
    };
  }

  factory KeyboardBuild.fromJson(Map<String, dynamic> json) {
    return KeyboardBuild(
        name: json['name'],
        keyboardswitch: json['switch'],
        keycap: json['keycap'],
        pcb: json['PCB'],
        keyboardcase: json['case']);
  }
}
