import 'package:dio/dio.dart';
import 'package:quizer/core/resources/constants.dart';
import 'package:quizer/features/data_sources/models/users.dart';

class RemoteDataSource{
  late Dio dio;
  
  RemoteDataSource(this.dio);

  Future<void> registerUser(UserModel user) async {
    try {
      final response = await dio.post(
        '${Constants.baseUrl}/register',
        data: user.toJson(),
      );

      if (response.statusCode == 200) {
        // successful
      } else {
        throw Exception('Failed to register user');
      }
    } catch (error) {
      throw Exception('Error during registration: $error');
    }
  }

  Future<void> loginUser(UserModel user) async {
    try {
      final response = await dio.post(
        '${Constants.baseUrl}/login',
        data: user.toJson(),
      );
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