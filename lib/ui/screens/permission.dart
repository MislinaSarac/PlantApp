import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constants.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
        backgroundColor: Constants.primaryColor,
      ),
      body: const Home(),
      
      
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            checkPermission(Permission.location, context);
          },
          child: Text(
            "Check Permission",
            style: TextStyle(color: Constants.primaryColor),
          )),
    );
  }

  Future<void> checkPermission(
      Permission permission, BuildContext context) async {
    var status = await permission.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Permission is Granted")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Permission is not Granted")));
    }
  }
}
