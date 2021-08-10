class StateData {
  String id;
  String stateName;
  String stateCode;
  String capital;
  String zipCode;
  int v;

  StateData({this.id, this.stateName, this.stateCode, this.capital, this.zipCode, this.v});

  factory StateData.fromJson(Map<String, dynamic> json) {
    return StateData(
      id: json['_id'],
      stateName: json['stateName'],
      stateCode: json['stateCode'],
      capital: json['capital'],
      zipCode: json['zipCode'],
      v: json['__v'],
    );
  }
}
