
import 'package:quizer/features/domain/repository/auth_repository.dart';

class GetOTPUseCase {
  final AuthRepository repository;

  GetOTPUseCase(this.repository);

  Future<void> call(String email) async => await repository.getOTP(email);
}
