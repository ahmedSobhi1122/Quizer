import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizer/core/resources/constants.dart';
import 'package:quizer/features/data_sources/models/user_login_model.dart';
import 'package:quizer/features/data_sources/models/user_otp_profile_model.dart';
import 'package:quizer/features/data_sources/models/user_profile_model.dart';
import 'package:quizer/features/data_sources/models/user_register_model.dart';

class RemoteDataSource {
  late Dio dio;

  RemoteDataSource(this.dio);

  ///register by email and password
  Future<void> registerUser(UserRegisterModel user) async {
    // print(1);
    // print(user.toJson().fields);
    // try {
      final response = await dio.request(
        '${Constants.baseUrl}account/register',
        data: user.toJson(),
        options: Options(
          method: 'POST',
        ),
      );

      print("print:                                 ${response.statusMessage} ,  ${response.data} , ${response.statusCode}");
      if (response.statusCode == 200) {
        // successful
      } else {
        throw Exception('Failed to register user');
      }
    // } catch (error) {
    //   // print(2);
    //   // print(error);
    //   throw Exception('Error during registration: $error');
    // }
  }

  ///login by email and password
  Future<void> loginUser(UserLoginModel user) async {
    // var headers = { 'Authorization' : 'Bearer ${Constants.token}'; };
    try {
      final response = await dio.request(
        '${Constants.baseUrl}account/login',
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
      final LoginResult result =
          await FacebookAuth.instance.login(permissions: ['email']);

      print(2);
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;

        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        // Optionally, fetch user data from Facebook
        final userData = await FacebookAuth.instance.getUserData(
          fields: "email,name,picture",
        );

        // Here, you can access the user's email
        String? email = userData['email'];
        print("email : $email");

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

  ///get OTP
  Future<void> getOTP(String email) async {
    try {
      final response = await dio.request(
        '${Constants.baseUrl}email/setOTP',
        data: FormData.fromMap({
          'email': email,
        }),
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

  ///verify OTP
  Future<void> verifyOTP(String email, String code) async {
    try {
      final response = await dio.request(
        '${Constants.baseUrl}email/verifyOTP',
        data: FormData.fromMap({
          'email': email,
          'otp': code,
        }),
        options: Options(
          method: 'GET',
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

  ///rest password
  Future<void> resetPassword(String email, String newPassword) async {
    try {
      final response = await dio.request(
        '${Constants.baseUrl}account/resetPassword',
        data: FormData.fromMap({
          'email': email,
          'newPassword': newPassword,
        }),
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

  ///user exist
  Future<bool> userExist(String email) async {
    try {
      final response = await dio.request(
        '${Constants.baseUrl}account/userExist',
        data: FormData.fromMap({
          'email': email,
        }),
        options: Options(
          method: 'POST',
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        // successful
        return response.data;
      } else {
        throw Exception('Failed to email');
      }
    } catch (error) {
      throw Exception('Error during get user: $error');
    }
  }

  ///otp profile
  Future<OTPProfileModel> otpProfile(String email) async {
    OTPProfileModel user = OTPProfileModel(email: email);
    try {
      final response = await dio.request(
        '${Constants.baseUrl}account/otpProfile',
        data: user.toJson(),
        options: Options(
          method: 'GET',
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        // successful
        user = OTPProfileModel.fromJson(response.data);
        return user;
      } else {
        throw Exception('User Not Found');
      }
    } catch (error) {
      throw Exception('Error during get otp profile: $error');
    }
  }

  ///get profile
  Future<ProfileModel> getProfile(String email) async {
    ProfileModel user = ProfileModel(email: email);
    try {
      final response = await dio.request(
        '${Constants.baseUrl}account/getProfile',
        data: user.toJson(),
        options: Options(
          method: 'GET',
        ),
      );
      if (response.statusCode == 200) {
        // successful
        user = ProfileModel.fromJson(response.data);
        return user;
      } else {
        throw Exception('Failed to get data profile');
      }
    } catch (error) {
      throw Exception('Error during get profile: $error');
    }
  }

}
