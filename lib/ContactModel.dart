class ContactModel {
  String? name;
  String? number;

  ContactModel({this.name, this.number});

  ContactModel.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["number"] is String) {
      number = json["number"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["number"] = number;
    return _data;
  }
}