import 'package:quizer/features/domain/repository/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<void> call(String email,String newPassword) async => await repository.resetPassword(email,newPassword);
}