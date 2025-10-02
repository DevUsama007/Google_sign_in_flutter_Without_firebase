import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({super.key});

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {

  // if (kIsWeb) {
  //           webGoogleLogin();
  //         }
  //         if (Platform.isAndroid) {
  //           androidGoogleLogin();
  //         } else {
  //           print('Plateform not supported');
  //         }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}