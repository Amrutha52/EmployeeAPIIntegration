import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/home_screen_models/employees_data_model.dart';

class HomeScreenController with ChangeNotifier
{
  EmployeesDataModel? employeesDataModel;

  fetchData()
  async {
    final url = Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
    var responseData = await http.get(url);
    if(responseData.statusCode == 200)
      {
        employeesDataModel = employeesDataModelFromJson(responseData.body);

      }
    notifyListeners();
  }
}