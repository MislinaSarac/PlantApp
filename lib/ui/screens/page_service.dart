import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/user_model.dart';
import 'package:plant_app/service/user_service.dart';

class PageService extends StatefulWidget {
  const PageService({super.key});

  @override
  State<PageService> createState() => _PageServiceState();
}

class _PageServiceState extends State<PageService> {
  UserService _service = UserService();
  bool? IsLoading;

  List<UsersModelData> users = [];

  @override
  void initState() {
    super.initState();
    _service.fetchUsers().then((value) {
      if (value != null && value.data != null) {
        setState(() {});
      } else {
        setState(() {
          IsLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WE ALL'),
        backgroundColor: Constants.primaryColor,
      ),
      body: IsLoading == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : IsLoading == true
              ? ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          "${users[index]!.firstName! + users[index]!.lastName!}"),
                      subtitle: Text(users[index]!.email!),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(users[index]!.avatar!),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("Bir sorun oluştu.."),
                ),
    );
  }
}
