import 'package:quizer/features/domain/entities/category.dart';
import 'package:quizer/features/domain/repository/account_repository.dart';

class GetCategoriesUseCase {
  final AccountRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<Category>> call(
          String token, int pageNumber, int pageSize) async =>
      await repository.getCategories(token, pageNumber, pageSize);
}
