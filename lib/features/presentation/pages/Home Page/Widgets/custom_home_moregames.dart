import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_values.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/text_styles.dart';

class CustomHomeMoreGames extends StatelessWidget {
  static SliverGridDelegateWithFixedCrossAxisCount gridDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppSize.s24.w,
          mainAxisSpacing: AppSize.s24.h,
          childAspectRatio: 172 / 273);
  static const NeverScrollableScrollPhysics gridPhysics =
      NeverScrollableScrollPhysics();

  const CustomHomeMoreGames({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: gridPhysics,
      gridDelegate: gridDelegate,
      itemCount: 20,
      itemBuilder: (context, index) {
        return CustomGame(index: index);
      },
    );
  }
}  // TODO GridView.builder here -- better change to sliver I think

class CustomGame extends StatelessWidget {
  final int index;

  const CustomGame({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(AppBorderRadius.br16),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppBorderRadius.br16),
                  topRight: Radius.circular(AppBorderRadius.br16),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageAssets.cringe),
                        fit: BoxFit.cover),
                  ),
                )),
          ), // TODO image here
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(AppPadding.p8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Arabic Language Quiz",
                          style: AppTextStyles.homeTitlesTextStyle(context),
                        ),
                        TextSpan(
                          text: "\n • By Ahmed Mohsen",
                          style:
                              AppTextStyles.homeGameCardTitleTextStyle(context),
                        ),
                      ],
                    ),
                  ),
                  // Title and Author
                  const Spacer(),
                  const CustomInfo()
                ],
              ),
            ),
          )  // TODO CardData here
        ],
      ),
    );
  }
}

class CustomInfo extends StatelessWidget {
  const CustomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("15 Question",style:
        AppTextStyles.homeGameCardTitleTextStyle(context)),
        const CustomDot(),
        const CustomInfoComponent(data: "15Min",icon: Icons.timer),
        const CustomDot(),
        const CustomInfoComponent(data: "3.5/5",icon: Icons.star),
      ],
    );
  }
}


class CustomInfoComponent extends StatelessWidget {
  final String data;
  final IconData icon;

  const CustomInfoComponent({super.key, required this.data, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text(data,style:
          AppTextStyles.homeGameCardTitleTextStyle(context)),
      Icon(icon,size: AppSize.s10.r,)
    ]);
  }
}

class CustomDot extends StatelessWidget {
  const CustomDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(" • ", style: AppTextStyles.homeGameCardTitleTextStyle(context));
  }
}

