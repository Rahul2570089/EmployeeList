import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee/list.dart';
import 'package:flutter/material.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  List<EmpDetails> emp = [];

  Future<List<EmpDetails>> get() async {
    QuerySnapshot q =
        await FirebaseFirestore.instance.collection("Employees").get();
    for (var i in q.docs) {
      emp.add(EmpDetails(
        name: i['Name'],
        exp: i['Experience'],
      ));
    }
    return emp;
  }

  Widget employeeList(List<EmpDetails> emp) {
    return ListView.builder(
      itemCount: emp.length,
      itemBuilder: (context, index) {
        return Card(
          shadowColor: Colors.grey,
          color: Colors.white70,
          child: ListTile(
            style: ListTileStyle.drawer,
            title: Text(
              emp[index].name!,
              style: TextStyle(
                  color: emp[index].exp! >= 5 ? Colors.green : Colors.black, fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              "${emp[index].exp!} years",
              style: TextStyle(
                  color: emp[index].exp! >= 5 ? Colors.green : Colors.black),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees List', style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<EmpDetails>>(
        future: get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black,),
            );
          } else {
            return employeeList(snapshot.data!);
          }
        },
      ),
    );
  }
}
