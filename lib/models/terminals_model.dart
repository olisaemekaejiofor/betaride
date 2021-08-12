class TerminalData {
  TerminalLocation location;
  String id;
  String terminalName;
  String address;
  String state;
  int v;

  TerminalData({
    this.location,
    this.id,
    this.terminalName,
    this.address,
    this.state,
    this.v,
  });

  factory TerminalData.fromJson(Map<String, dynamic> json) {
    return TerminalData(
      location: TerminalLocation.fromJson(json['location']),
      id: json['_id'],
      terminalName: json['terminalName'],
      address: json['address'],
      state: json['state'],
      v: json['__v'],
    );
  }
}

class TerminalLocation {
  String type;
  List<dynamic> coordinates;
  String formattedAddress;
  String city;
  String state;
  String country;

  TerminalLocation({
    this.type,
    this.coordinates,
    this.formattedAddress,
    this.city,
    this.state,
    this.country,
  });

  factory TerminalLocation.fromJson(Map<String, dynamic> json) {
    return TerminalLocation(
      type: json['type'],
      coordinates: json['coordinates'],
      formattedAddress: json['formattedAddress'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
    );
  }
}
