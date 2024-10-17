import 'package:quizer/features/presentation/state/home_categories_state.dart';

import '../../../config/routes/screen_export.dart';
import '../../domain/usecases/get_home_categories_usecase.dart';

class HomeCategoriesCubit extends Cubit<HomeCategoriesState>
{
  final GetHomeCategoriesUseCase getHomeCategoriesUseCase;
  HomeCategoriesCubit(this.getHomeCategoriesUseCase) : super(HomeCategoriesInitial());

  Future<void> getHomeCategories (String token) async
  {
    emit(HomeCategoriesLoading());
    try
    {
      final categories = await getHomeCategoriesUseCase(token);
      emit(HomeCategoriesLoaded(categories: categories));
    }
    catch (e)
    {
      emit(HomeCategoriesFailure(error: e.toString()));
    }
  }

}