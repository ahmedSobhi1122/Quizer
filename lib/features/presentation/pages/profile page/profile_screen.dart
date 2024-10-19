import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/core/constants/constants.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/cubit/profile_cubit.dart';
import 'package:quizer/features/presentation/pages/profile%20page/widgets/profile_body.dart';
import 'package:quizer/features/presentation/state/profile_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _loading = false;
  String? firstName;
  String? lastName;
  String? description;
  String? profileImage;
  String? coverImage;
  Rank? rank;
  int? firstPlaceCount;
  int? secondPlaceCount;
  int? thirdPlaceCount;

  @override
  void initState() {
    super.initState();
    String? userID = DataIntent.getUserID();
    String? token = DataIntent.getToken();
    context.read<ProfileCubit>().getProfile(userID!, token!);
  }

  @override
  Widget build(BuildContext context) {
    print(DataIntent.getUserID());
    print(DataIntent.getToken());
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccess) {
                firstName = state.user.firstName;
                lastName = state.user.lastName;
                description = state.user.description;
                profileImage = Constants.url + state.user.profileImage!;
                coverImage = Constants.url + state.user.coverImage!;
                DataIntent.pushProfileData(
                  firstName: firstName,
                  lastName: lastName,
                  description: description,
                  profileImage: profileImage,
                  coverImage: coverImage,
                );
                rank = state.user.rank;
                firstPlaceCount = state.user.firstPlaceCount;
                secondPlaceCount = state.user.secondPlaceCount;
                thirdPlaceCount = state.user.thirdPlaceCount;
                _loading = false;
              } else if (state is ProfileFailure) {
                _loading = false;
                return Center(
                  child: Text(state.error),
                );
              } else if (state is ProfileLoading) {
                _loading = true;
              }
              return Skeletonizer(
                enabled: _loading,
                child: Profile(
                  firstName: firstName,
                  lastName: lastName,
                  rank: rank,
                  firstPlaceCount: firstPlaceCount,
                  secondPlaceCount: secondPlaceCount,
                  thirdPlaceCount: thirdPlaceCount,
                  description: description,
                  profileImage: profileImage,
                  coverImage: coverImage,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
