import 'package:flutter/material.dart';
import 'package:google_sign_in_without_firebas/services/authServices.dart';
import 'package:google_sign_in_without_firebas/utils/notificationUtils.dart';

class HomeScreenView extends StatefulWidget {
  String userid;
  String name;
  String email;
  String dp;
  String accessToken;
  HomeScreenView(
      {super.key,
      required this.userid,
      required this.name,
      required this.email,
      required this.dp,required this.accessToken});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  AuthServices _authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 188, 188),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () async {
              try {
                await _authServices.androidSignOut();
                Navigator.pop(context);
                ShowNotification.customNotifcation(context, 'Sign Out');
              } catch (e) {
                ShowNotification.customNotifcation(context, 'Failed Sign Out');
              }
            },
            child: Icon(
              Icons.logout,
              color: Colors.white60,
              size: 30,
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],
        title: Text(
          overflow: TextOverflow.ellipsis,
          'WELLCOME TO hOMEsCREEN',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.dp == ''
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    color: Colors.white.withOpacity(0.4),
                    child: Container(
                      // decoration:
                      //     BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.dp == 'notAvailable'
                                ? CircleAvatar(
                                    radius: 60,
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(widget.dp),
                                    backgroundColor: Colors.grey,
                                    radius: 60,
                                  ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Text(
                                  "UserID:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    widget.userid,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Name:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Email:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    widget.email,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Access Token:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    widget.accessToken,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
