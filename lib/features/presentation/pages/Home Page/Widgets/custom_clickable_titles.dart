
import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/text_styles.dart';

class CustomClickableTitles extends StatelessWidget {
  final String title;
  final String clickable;
  final void Function() clickableOnTap;
  const CustomClickableTitles({super.key, required this.title, required this.clickable, required this.clickableOnTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: AppTextStyles.homeTitlesTextStyle(context),),
        InkWell(
            onTap: clickableOnTap,
            child: Text(clickable,style: AppTextStyles.homeSubTitlesTextStyle(context),)),
      ],
    );
  }
}