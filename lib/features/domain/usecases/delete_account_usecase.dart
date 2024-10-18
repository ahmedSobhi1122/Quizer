import 'package:quizer/features/domain/repository/account_repository.dart';

class DeleteAccountUsecase {
  final AccountRepository repository;

  DeleteAccountUsecase(this.repository);

  Future<void> call(String userID,String token) async => await repository.deleteAccount(userID,token);
}
