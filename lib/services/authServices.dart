import 'package:google_sign_in/google_sign_in.dart';

// import 'package:jwt_decoder/jwt_decoder.dart';
class AuthServices {
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
    final GoogleSignInAccount? googleSignOut = await GoogleSignIn().signOut();
    if (googleSignOut == null) {
      print('Sign Out Successfuly');
    } else {
      print('Sign Out failed');
    }
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
}
