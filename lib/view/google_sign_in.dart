import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in_without_firebas/services/authServices.dart';
import 'package:google_sign_in_without_firebas/view/customWidget/customButtonWidget.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({super.key});

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  AuthServices _authServices = AuthServices();
  bool loading = false;
  toggleLoading(bool _loading) {
    loading = _loading;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 188, 188),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: FlutterLogo(
                size: 120,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 70, top: 20, bottom: 5),
              child: Text(
                'Hey There Welcome Back',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text('Login To Your Account to Continue'),
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(
                    color: const Color.fromARGB(255, 110, 109, 109),
                  ))
                : CustomButtonWidget(
                    ontap: () async {
                      toggleLoading(true);
                      if (kIsWeb) {
                        await _authServices.webGoogleLogin(context);
                        toggleLoading(false);
                      }
                      if (Platform.isAndroid) {
                        await _authServices.androidGoogleLogin(context);
                        toggleLoading(false);
                      }
                    },
                    title: 'Continue with Google'),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
