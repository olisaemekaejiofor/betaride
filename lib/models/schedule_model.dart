class ScheduleData {
  List passengers;
  String paymentType;
  String id;
  String fromAddress;
  String toAddress;
  String startTime;
  String endTime;
  String stateId;
  String terminalId;
  String distance;
  List riderId;
  String driverId;
  String createdAt;
  String updatedAt;
  int v;

  ScheduleData({
    this.passengers,
    this.paymentType,
    this.id,
    this.fromAddress,
    this.toAddress,
    this.startTime,
    this.endTime,
    this.stateId,
    this.terminalId,
    this.distance,
    this.riderId,
    this.driverId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ScheduleData.fromJson(Map<String, dynamic> json) {
    return ScheduleData(
      passengers: json['passengers'],
      paymentType: json['paymentType'],
      id: json['_id'],
      fromAddress: json['fromAddress'],
      toAddress: json['toAddress'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      stateId: json['stateId'],
      terminalId: json['termialId'],
      distance: json['distanceInMiles'],
      riderId: json['riderId'],
      driverId: json['driverid'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
