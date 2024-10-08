
import 'package:quizer/features/domain/repository/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<void> call(String email,String code) async => await repository.verifyOTP(email,code);
}
