// To parse this JSON data, do

// Example  = How to use

// Json String to Dart Object/Instance conversion
// final serviceEntity = serviceEntityFromMap(jsonString);

// Dart Object to Json String and then to Dart Map conversion
// final serviceEntity = serviceEntityToMap(jsonString);
// after receiving Json String, we can convert it to Dart Map through below code
// final data = json.decode(Json String);

import 'dart:convert';

ServiceEntity serviceEntityFromMap(String str) =>
    ServiceEntity.fromMap(json.decode(str));

// Object to Json String
String serviceEntityToMap(ServiceEntity data) => json.encode(data.toMap());

class ServiceEntity {
  final String bookingId;
  final String bikeName;
  final String bikeNumber;
  final String mobileNumber;
  final String fullAddress;
  final String serviceDate;
  final String serviceTime;
  final String onlinePaymentUpiNumber;
  final List<SelectedServiceList> selectedServiceList;
  final String totalPrice;
  final ServiceStatus serviceStatus;

  ServiceEntity({
    required this.bookingId,
    required this.bikeName,
    required this.bikeNumber,
    required this.mobileNumber,
    required this.fullAddress,
    required this.serviceDate,
    required this.serviceTime,
    required this.onlinePaymentUpiNumber,
    required this.selectedServiceList,
    required this.totalPrice,
    required this.serviceStatus,
  });

  factory ServiceEntity.fromMap(Map<String, dynamic> json) => ServiceEntity(
        bookingId: json["Booking ID"],
        bikeName: json["Bike Name"],
        bikeNumber: json["Bike Number"],
        mobileNumber: json["Mobile Number"],
        fullAddress: json["Full Address"],
        serviceDate: json["Service Date"],
        serviceTime: json["Service Time"],
        onlinePaymentUpiNumber: json["Online Payment UPI Number"],
        selectedServiceList: List<SelectedServiceList>.from(
            json["Selected Service List"]
                .map((x) => SelectedServiceList.fromMap(x))),
        totalPrice: json["Total Price"],
        serviceStatus: ServiceStatus.fromMap(json["Service Status"]),
      );

  Map<String, dynamic> toMap() => {
        "Booking ID": bookingId,
        "Bike Name": bikeName,
        "Bike Number": bikeNumber,
        "Mobile Number": mobileNumber,
        "Full Address": fullAddress,
        "Service Date": serviceDate,
        "Service Time": serviceTime,
        "Online Payment UPI Number": onlinePaymentUpiNumber,
        "Selected Service List":
            List<dynamic>.from(selectedServiceList.map((x) => x.toMap())),
        "Total Price": totalPrice,
        "Service Status": serviceStatus.toMap(),
      };
}

class SelectedServiceList {
  final String serviceName;
  final int servicePrice;

  SelectedServiceList({
    required this.serviceName,
    required this.servicePrice,
  });

  factory SelectedServiceList.fromMap(Map<String, dynamic> json) =>
      SelectedServiceList(
        serviceName: json["service name"],
        servicePrice: json["service price"],
      );

  Map<String, dynamic> toMap() => {
        "service name": serviceName,
        "service price": servicePrice,
      };
}

class ServiceStatus {
  final String service;
  final String amount;

  ServiceStatus({
    required this.service,
    required this.amount,
  });

  factory ServiceStatus.fromMap(Map<String, dynamic> json) => ServiceStatus(
        service: json["service"],
        amount: json["amount"],
      );

  Map<String, dynamic> toMap() => {
        "service": service,
        "amount": amount,
      };
}
