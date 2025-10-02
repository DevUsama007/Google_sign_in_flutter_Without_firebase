import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> webGoogleLogin() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId:
            "748847791063-6t7ffi0v27f3295cudk9il12nfrcpq1u.apps.googleusercontent.com",
        scopes: ['email', 'profile'],
      );

      final user = await googleSignIn.signIn();
      final auth = await user!.authentication;
      print(auth.idToken.toString());
      print(user.displayName.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  androidSignOut() async {
    final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signOut();
    print('Sign Out Successfuly');
  }

  Future<void> androidGoogleLogin() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email', 'profile'],
      );
      final GoogleSignInAccount? user = await googleSignIn.signIn();

      final auth = await user!.authentication;
      if (user != null) {
        print("That is the access token for athentication ${auth.accessToken}");
        print(user.id.toString());
        print(user.displayName.toString());
        print(user.email);
      }
    } catch (e) {
      print(e.toString());
    }
  }
// import 'package:jwt_decoder/jwt_decoder.dart';

// void verifyIdToken(String idToken, String clientId) {
//   Map<String, dynamic> decodedToken = JwtDecoder.decode(idToken);

//   // Basic checks
//   String issuer = decodedToken['iss'];
//   String audience = decodedToken['aud'];
//   bool emailVerified = decodedToken['email_verified'] ?? false;
//   int exp = decodedToken['exp'];

//   if (issuer != "https://accounts.google.com") {
//     print("❌ Invalid issuer");
//     return;
//   }

//   if (audience != clientId) {
//     print("❌ Invalid client ID");
//     return;
//   }

//   if (DateTime.now().millisecondsSinceEpoch > exp * 1000) {
//     print("❌ Token expired");
//     return;
//   }

//   if (!emailVerified) {
//     print("❌ Email not verified");
//     return;
//   }

//   print("✅ ID Token is valid and email is verified!");
// }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GestureDetector(
              onTap: () {
                androidSignOut();
              },
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (kIsWeb) {
            webGoogleLogin();
          }
          if (Platform.isAndroid) {
            androidGoogleLogin();
          } else {
            print('Plateform not supported');
          }
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
