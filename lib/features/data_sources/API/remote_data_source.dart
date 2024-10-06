import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizer/core/resources/constants.dart';
import 'package:quizer/features/data_sources/models/user_login_model.dart';
import 'package:quizer/features/data_sources/models/user_register_model.dart';

class RemoteDataSource {
  late Dio dio;

  RemoteDataSource(this.dio);

  ///register by email and password
  Future<void> registerUser(UserRegisterModel user) async {
    // print(1);
    // print(user.toJson().fields);
    try {
      final response = await dio.request(
        '${Constants.baseUrl}account/register/emailPassword',
        data: user.toJson(),
        options: Options(
          method: 'POST',
        ),
      );

      // print("print:                                 ${response.statusMessage} ,  ${response.data} , ${response.statusCode}");
      if (response.statusCode == 200) {
        // successful
      } else {
        throw Exception('Failed to register user');
      }
    } catch (error) {
      // print(2);
      // print(error);
      throw Exception('Error during registration: $error');
    }
  }

  ///login by email and password
  Future<void> loginUser(UserLoginModel user) async {
    // var headers = { 'Authorization' : 'Bearer ${Constants.token}'; };
    try {
      final response = await dio.request(
        '${Constants.baseUrl}account/login/emailPassword',
        data: user.toJson(),
        options: Options(
          method: 'POST',
        ),
      );
      // print(response.data);
      if (response.statusCode == 200) {
        // successful
      } else {
        throw Exception('Failed to log in');
      }
    } catch (error) {
      throw Exception('Error during login: $error');
    }
  }

  ///google sign in
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential.user;
      }
    } catch (error) {
      throw Exception('Error during Google sign in $error');
    }
    return null;
  }

  /// Facebook sign-in function
  Future<User?> signInWithFacebook() async {
    print(1);
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email']
      );

      print(2);
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;

        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        return userCredential.user;
      } else if (result.status == LoginStatus.cancelled) {
        print('Facebook login cancelled');
      } else if (result.status == LoginStatus.failed) {
        print('Facebook login failed: ${result.message}');
      }
    } catch (error) {
      print(error);
      throw Exception('Error during Facebook sign in: $error');
    }

    return null;
  }
}
