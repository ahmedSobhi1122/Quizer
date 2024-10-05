import 'package:dio/dio.dart';
import 'package:quizer/core/resources/constants.dart';
import 'package:quizer/features/data_sources/models/user_login_model.dart';
import 'package:quizer/features/data_sources/models/user_register_model.dart';

class RemoteDataSource {
  late Dio dio;

  RemoteDataSource(this.dio);

  Future<void> registerUser(UserRegisterModel user) async {

    print(1);
    print(user.toJson().fields);
    try {
      final response = await dio.request(
        '${Constants.baseUrl}account/register/emailPassword',
        data: user.toJson(),
        options: Options(
          method: 'POST',
        ),
      );

      print("error:                                 ${response.statusMessage} ,  ${response.data} , ${response.statusCode}");
      if (response.statusCode == 200) {
        // successful

      } else {
        throw Exception('Failed to register user');
      }
    } catch (error) {
      print(2);
      print(error);
      throw Exception('Error during registration: $error');
    }
  }

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
}
