import 'package:quizer/features/domain/entities/category.dart';
import 'package:quizer/features/domain/repository/account_repository.dart';


class GetHomeCategoriesUseCase {
  final AccountRepository repository;

  GetHomeCategoriesUseCase(this.repository);

  Future<List<Category>> call(String token) async => await repository.getHomeCategories(token);
}