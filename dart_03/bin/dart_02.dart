class Vehicle {
  int? vehicleNumber;
  String? vehicleName;
  Vehicle({this.vehicleNumber, this.vehicleName});
  void details() {
    print("Number: $vehicleNumber");
    print("Number: $vehicleName");
  }
}

void main() {
  Vehicle v = Vehicle(vehicleNumber: 9009, vehicleName: "Swift");
  v.details();
}
