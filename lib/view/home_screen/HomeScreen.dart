import 'package:employeeapiintegration/controller/home_screen_controller.dart';
import 'package:employeeapiintegration/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  @override
  void initState()
  {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
     await context.read<HomeScreenController>().fetchData();
    });
  }
  @override
  Widget build(BuildContext context)
  {
    final homeProvider = context.watch<HomeScreenController>();

    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(homeProvider.employeesDataModel!.emDataModelList![index].employeeName.toString()),
            subtitle: Text(homeProvider.employeesDataModel!.emDataModelList![index].employeeAge.toString()),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 20,),
          itemCount: homeProvider.employeesDataModel.emDataModelList!.length ?? 0),
    );
  }
}
