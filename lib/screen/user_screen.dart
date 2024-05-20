import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getapi_using_provider/provider/user_provider.dart';
import 'package:provider/provider.dart';

class User_Screen extends StatefulWidget {
  const User_Screen({super.key});

  @override
  State<User_Screen> createState() => _User_ScreenState();
}

class _User_ScreenState extends State<User_Screen> {
  /// listen: false aa mukvi etle khali je widget run karvo che aaj thase.
  /// jo aa no karvi to akhi build method call thase.

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    final userprovider = Provider.of<UserController>(context, listen: false);
    await userprovider.getUserData();
    print('object ========> ${userprovider.userList}');
  }

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserController>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Consumer<UserController>(
              builder: (context, value, child) {
                if (value.loading) {
                  Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(userprovider.userList[index].name.toString()),
                      subtitle: Text(userprovider
                          .userList[index].address!.geo!.lat
                          .toString()),
                      leading: CircleAvatar(
                        maxRadius: 50,
                        backgroundColor: Colors.grey,
                        child: Text(
                          userprovider.userList[index].id.toString(),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                  itemCount: userprovider.userList.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
