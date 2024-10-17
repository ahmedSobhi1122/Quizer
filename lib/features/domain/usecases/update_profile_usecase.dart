import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/repository/account_repository.dart';


class UpdateProfileUsecase {
  final AccountRepository repository;

  UpdateProfileUsecase(this.repository);

  Future<void> call(User user) async => await repository.updateProfile(user);
}