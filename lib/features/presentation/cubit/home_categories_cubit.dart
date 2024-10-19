import 'package:quizer/features/presentation/state/home_categories_state.dart';

import '../../../config/routes/screen_export.dart';
import '../../domain/usecases/get_categories_usecase.dart';

class HomeCategoriesCubit extends Cubit<HomeCategoriesState>
{
  final GetCategoriesUseCase getHomeCategoriesUseCase;
  HomeCategoriesCubit(this.getHomeCategoriesUseCase) : super(HomeCategoriesInitial());

  Future<void> getHomeCategories (String token) async
  {
    emit(HomeCategoriesLoading());
    try
    {
      final categories = await getHomeCategoriesUseCase.call(token,1,100);
      emit(HomeCategoriesLoaded(categories: categories));
    }
    catch (e)
    {
      emit(HomeCategoriesFailure(error: e.toString()));
    }
  }

}