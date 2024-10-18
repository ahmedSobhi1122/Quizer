import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/constants/constants.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/presentation/pages/leadboard%20page/widgets/user_card.dart';

class MyDraggableSheet extends StatelessWidget {
  final Widget child;
  final List<User>? users;

  const MyDraggableSheet({super.key, required this.child, required this.users});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5.h,
      minChildSize: 0.5.h,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                MyTheme.backgroundColor1,
                MyTheme.backgroundColor2,
                MyTheme.backgroundColor3,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppBorderRadius.br24),
            ),
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: (users?.length ?? 3) - 3,
            padding: EdgeInsets.all(AppPadding.p30.r),
            itemBuilder: (context, index) {
              return UserProfileCard(
                name:
                    "${users?[index + 3].firstName ?? ""} ${users?[index + 3].lastName ?? ""}",
                points: users?[index + 3].points ?? 0,
                rank: index + 3,
                url: Constants.url + (users?[index + 3].profileImage ?? ""),
              );
            },
            // Link the ListView to the ScrollController
          ),
        );
      },
    );
  }
}
