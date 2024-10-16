import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizer/core/constants/constants.dart';
import 'package:quizer/features/data_sources/models/user_home_profile_model.dart';
import 'package:quizer/features/data_sources/models/user_login_model.dart';
import 'package:quizer/features/data_sources/models/user_otp_profile_model.dart';
import 'package:quizer/features/data_sources/models/user_profile_model.dart';
import 'package:quizer/features/data_sources/models/user_register_model.dart';

import '../models/home_quizzes_model.dart';

class RemoteDataSource {
  late Dio dio;

  RemoteDataSource(this.dio);

  ///register by email and password
  Future<UserRegisterModel> registerUser(UserRegisterModel user) async {
    // print(1);
    // print(user.toJson().fields);
    try {
      final response = await dio.request(
        '${Constants.baseUrl}auth/emailPassword/register',
        data: user.toJson(),
        options: Options(
          method: 'POST',
        ),
      );

      // print("print:                                 ${response.statusMessage} ,  ${response.data} , ${response.statusCode}");
      if (response.statusCode == 200) {
        // successful
        return UserRegisterModel.fromJson(response.data["data"]);
      } else {
        throw Exception(response.data["message"]);
      }
    } catch (error) {
      //   // print(2);
      // print(error);
      throw Exception('Error during registration: $error');
    }
  }

  ///login by email and password
  Future<UserLoginModel> loginUser(UserLoginModel user) async {
    // var headers = { 'Authorization' : 'Bearer ${Constants.token}'; };
    try {
      final response = await dio.request(
        '${Constants.baseUrl}auth/emailPassword/login',
        data: user.toJson(),
        options: Options(
          method: 'POST',
        ),
      );
      // print(response.data);
      if (response.statusCode == 200) {
        // successful
        return UserLoginModel.fromJson(response.data["data"]);
      } else {
        throw Exception(response.data["message"]);
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
        //TODO :  send data to server
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

        //TODO :  send data to server

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
        data: FormData.fromMap({'email': email}),
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
      print(response.data["data"]);
      if (response.statusCode == 200) {
        // successful
        return response.data["data"];
      } else {
        throw Exception(response.data["message"]);
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
          method: 'POST',
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        // successful
        user = OTPProfileModel.fromJson(response.data["data"]);
        return user;
      } else {
        throw Exception(response.data["message"]);
      }
    } catch (error) {
      throw Exception('Error during get otp profile: $error');
    }
  }

  ///home profile
  Future<HomeProfileModel> homeProfile(String userID) async {
    HomeProfileModel user = HomeProfileModel(userID: userID);
    try {
      final response = await dio.request(
        '${Constants.baseUrl}account/homeProfile',
        data: user.toJson(),
        options: Options(
          method: 'POST',
        ),
      );
      var responseData = response.data["data"];
      var responseMessage = response.data["message"];
      print(responseMessage);
      print(responseData);

      if (response.statusCode == 200) {
        // successful
        user = HomeProfileModel.fromJson(responseData);
        return user;
      } else {
        throw Exception('Error: $responseMessage');
      }
    } catch (error) {
      throw Exception(
          'remote_data_source--Error getting Home Profile Data: $error');
    }
  }

  ///home Quizzes TODO -- Add Token to header
  Future<List<HomeQuizzesModel>> homeQuizzes(String token) async {
    List<HomeQuizzesModel> quizzes = [];

    try {
      final response = await dio.request(
        '${Constants.baseUrl}quiz',
        options: Options(
          method: 'GET',
        ),
      );

      var responseData = response.data["data"] as List?;
      var responseMessage = response.data["message"];

      if (response.statusCode == 200) {
        print(responseMessage);
        print(responseData);
        quizzes = responseData!.map((quiz) => HomeQuizzesModel.fromJson(quiz))
            .toList();
        return quizzes;
      }
      else {
        throw Exception('Error: $responseMessage');
      }
    }
    catch (error) {
      throw Exception(
          'remote_data_source--Error getting Home Profile Data: $error');
    }
  }

  ///get profile
  Future<ProfileModel> getProfile(String id, String token) async {
    ProfileModel user = ProfileModel(id: id, token: token);
    try {
      final response = await dio.request(
        '${Constants.baseUrl}account/getProfile',
        data: user.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          method: 'POST',
        ),
      );
      if (response.statusCode == 200) {
        // successful
        user = ProfileModel.fromJson(response.data["data"]);
        return user;
      } else {
        throw Exception(response.data["message"]);
      }
    } catch (error) {
      throw Exception('Error during get profile: $error');
    }
  }
}
