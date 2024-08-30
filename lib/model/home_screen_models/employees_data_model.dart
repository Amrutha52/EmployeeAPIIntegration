
// To parse this JSON data, do
//
//     final employeesDataModel = employeesDataModelFromJson(jsonString);

import 'dart:convert';

EmployeesDataModel employeesDataModelFromJson(String str) => EmployeesDataModel.fromJson(json.decode(str));

String employeesDataModelToJson(EmployeesDataModel data) => json.encode(data.toJson());

class EmployeesDataModel {
  String? status;
  List<EmDataModel>? emDataModelList;
  String? message;

  EmployeesDataModel({
    this.status,
    this.emDataModelList,
    this.message,
  });

  factory EmployeesDataModel.fromJson(Map<String, dynamic> json) => EmployeesDataModel(
    status: json["status"],
    emDataModelList: json["data"] == null ? [] : List<EmDataModel>.from(json["data"]!.map((x) => EmDataModel.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": emDataModelList == null ? [] : List<dynamic>.from(emDataModelList!.map((x) => x.toJson())),
    "message": message,
  };
}

class EmDataModel {
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? profileImage;

  EmDataModel({
    this.id,
    this.employeeName,
    this.employeeSalary,
    this.employeeAge,
    this.profileImage,
  });

  factory EmDataModel.fromJson(Map<String, dynamic> json) => EmDataModel(
    id: json["id"],
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge: json["employee_age"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_name": employeeName,
    "employee_salary": employeeSalary,
    "employee_age": employeeAge,
    "profile_image": profileImage,
  };
}
