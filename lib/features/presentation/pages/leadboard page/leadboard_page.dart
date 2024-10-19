import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/presentation/cubit/leaderboard_cubit.dart';
import 'package:quizer/features/presentation/pages/leadboard%20page/widgets/leaderboard_body.dart';
import 'package:quizer/features/presentation/state/leaderboard_state.dart';
import 'package:skeletonizer/skeletonizer.dart';


class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  List<User> users = [
    User(
      id: DataIntent.getUserID(),
      firstName: "Ahmed",
      lastName: "Sobhi",
      profileImage: "/images/unknown/default.jpeg",
      points: 0,
    ),
    User(
      id: DataIntent.getUserID(),
      firstName: "Ahmed",
      lastName: "Sobhi",
      profileImage: "/images/unknown/default.jpeg",
      points: 0,
    ),
    User(
      id: DataIntent.getUserID(),
      firstName: "Ahmed",
      lastName: "Sobhi",
      profileImage: "/images/unknown/default.jpeg",
      points: 0,
    ),
  ];
  bool _loading = false;

  @override
  void initState() {
    context.read<LeaderboardCubit>().getLeaderboard(DataIntent.getToken()!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text(
          "Leaderboard",
          style: AppTextStyles.leaderboardTitleTextStyle(context),
        ),
        centerTitle: true,
        backgroundColor: MyTheme.backgroundColor,
      ),
      backgroundColor: MyTheme.backgroundColor,
      body: BlocBuilder<LeaderboardCubit, LeaderboardState>(
        builder: (context, state) {
          if (state is LeaderBoardSuccess) {
            users = state.users;
            _loading = false;
          } else if (state is LeaderBoardFailure) {
          } else {
            _loading = true;
          }
          print(state);
          return Skeletonizer(
            enabled: _loading,
            child: Screen(
              users: users,
            ),
          );
        },
      ),
    );
  }
}
