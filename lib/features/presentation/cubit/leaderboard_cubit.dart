import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/usecases/leaderboard_usecase.dart';
import 'package:quizer/features/presentation/state/leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  final LeaderboardUsecase leaderboardUseCase;

  LeaderboardCubit(this.leaderboardUseCase) : super(LeaderBoardInitial());

  Future<void> getLeaderboard(String token) async {
    emit(LeaderBoardLoading());
    try {
      final result = await leaderboardUseCase(token);
      emit(LeaderBoardSuccess(result));
    } catch (e) {
      emit(LeaderBoardFailure(e.toString()));
    }
  }
}
