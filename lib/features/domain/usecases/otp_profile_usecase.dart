import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';

class OtpProfileUseCase {
  final AuthRepository repository;

  OtpProfileUseCase(this.repository);

  Future<User> call(String email) async => await repository.otpProfile(email);
}
