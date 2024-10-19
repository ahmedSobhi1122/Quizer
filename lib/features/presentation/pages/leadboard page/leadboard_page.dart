import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/config/themes/theme.dart';
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
      id: "43d48674-ebfb-4596-b9e9-7a02b291fb8f",
      firstName: "Ahmed",
      lastName: "Sobhi",
      profileImage: "/images/unknown/default.jpeg",
      points: 0,
    ),
    User(
      id: "43d48674-ebfb-4596-b9e9-7a02b291fb8f",
      firstName: "Ahmed",
      lastName: "Sobhi",
      profileImage: "/images/unknown/default.jpeg",
      points: 0,
    ),
    User(
      id: "43d48674-ebfb-4596-b9e9-7a02b291fb8f",
      firstName: "Ahmed",
      lastName: "Sobhi",
      profileImage: "/images/unknown/default.jpeg",
      points: 0,
    ),
  ];
  bool _loading = false;

  @override
  void initState() {
    context.read<LeaderboardCubit>().getLeaderboard(
        "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJnaXZlbl9uYW1lIjoiemVpYWQiLCJmYW1pbHlfbmFtZSI6Im1vaGFtbWVkIiwiZW1haWwiOiJ6YXphb3NrYXI5MjhAZ21haWwuY29tIiwibmJmIjoxNzI5MzA1MTEwLCJleHAiOjE3MzE5ODcxMTAsImlhdCI6MTcyOTMwNTExMCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2In0.8yXZSufGpX0Dx9KD0jjEaMe3n4eYshpH5pSBnO9g-ET36DOLBTy0ftbxn6fnGpstC83CIvspHdMNv-wpH9JirA");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: MyTheme.textColor,
        ),
        title: Text(
          "Leaderboard",
          style: AppTextStyles.leaderboardTitleTextStyle(context),
        ),
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
