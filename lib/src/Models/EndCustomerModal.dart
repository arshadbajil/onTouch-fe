class EndCustomerModal {
  int id;
  String userToken;
  String name;

  EndCustomerModal.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return;
    }
    id = json['id'];
    userToken = json['token'];
    name = json['name'];
  }

  static List<EndCustomerModal> listFromJson(List<dynamic> json) {
    return json == null
        ? List<EndCustomerModal>()
        : json.map((value) => EndCustomerModal.fromJson(value)).toList();
  }

  static EndCustomerModal dataFromJson(Map<String, dynamic> json) {
    if (json == null) {
      return EndCustomerModal.fromJson(null);
    } else {
      return EndCustomerModal.fromJson(json);
    }
  }
}
