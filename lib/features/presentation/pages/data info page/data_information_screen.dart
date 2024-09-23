import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/custom_progress.dart';
import 'package:quizer/features/presentation/pages/data%20info%20page/widgets/date_of_birth.dart';

class DataInfoScreen extends StatelessWidget {
  const DataInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: context.width,
      height: context.height,
      padding: EdgeInsets.only(top: context.height * .032),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.purpleColor50,
          AppColors.purpleColor30,
          AppColors.purpleColor10,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              const BackButton(),
              SizedBox(
                width: context.width * .12,
              ),
              const CustomProgress(
                progress: 2,
              ),
            ],
          ),
          SizedBox(height: context.height * .025),
          Text(
            '''Create an account ✏️''',
            style: AppTextStyles.headerSignupTextStyle(context),
          ),
          SizedBox(height: context.height * .01),
          Text(
            '''Please complete your profile''',
            style: AppTextStyles.subHeaderSignupTextStyle(context),
          ),
          SizedBox(height: context.height * .0966),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: context.width * .349,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "First Name",
                  hintStyle: TextStyle(color: AppColors.purpleColor50),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
                ),
                style: AppTextStyles.textStyle(context),
              ),
            ),
            SizedBox(width: context.width * .025),
            SizedBox(
              width: context.width * .349,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Last Name",
                  hoverColor: AppColors.purpleColor,
                  // border: InputBorder,
                  hintStyle: TextStyle(color: AppColors.purpleColor50),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
                ),
                style: AppTextStyles.textStyle(context),
              ),
            ),
          ]),
          SizedBox(height: context.height * .025),
          SizedBox(
            width: context.width * .732,
            child: const DateOfBirth(),
          ),
          SizedBox(height: context.height * .025),
          SizedBox(
            width: context.width * .732,
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Phone Number",
                hoverColor: AppColors.purpleColor,
                // border: InputBorder,
                hintStyle: TextStyle(color: AppColors.purpleColor50),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
              ),
              keyboardType: TextInputType.phone,
              style: AppTextStyles.textStyle(context),
            ),
          ),
          SizedBox(height: context.height * .025),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: context.width * .25,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Gender",
                    hoverColor: AppColors.purpleColor,
                    // border: InputBorder,
                    hintStyle: TextStyle(color: AppColors.purpleColor50),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: AppPadding.defaultPadding),
                  ),
                  style: AppTextStyles.textStyle(context),
                  readOnly: true,
                ),
              ),
              SizedBox(width: context.width * .22),
              const GenderSelection(),
            ],
          ),
          SizedBox(height: context.height * 0.172,),
          CustomButton(
            color: AppColors.lightPurpleColor.withOpacity(.7),
            colorText: AppColors.purpleColor,
            text: "Next",
            onPressed: () =>context.pushNamed(Routes.signUpScreenRoute),
          ),
        ]),
      ),
    ));
  }
}

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int _isSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (_isSelected == -1) {
                _isSelected = 0;
              } else {
                _isSelected = _isSelected == 0 ? 1 : 0;
              }
            });
          },
          child: Container(
            width: context.width * .121,
            // height: context.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppBorderRadius.br16),
              color: _isSelected != 0
                  ? AppColors.whiteColor
                  : AppColors.purpleColor50,
            ),
            child: const Center(
                child: Text(
              "M",
              style: TextStyle(
                  color: AppColors.blueColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        SizedBox(width: context.width * .025),
        GestureDetector(
          onTap: () {
            setState(() {
              if (_isSelected == -1) {
                _isSelected = 1;
              } else {
                _isSelected = _isSelected == 1 ? 0 : 1;
              }
            });
          },
          child: Container(
            width: context.width * .121,
            // height: context.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                color: _isSelected != 1
                    ? AppColors.whiteColor
                    : AppColors.purpleColor50),
            child: const Center(
                child: Text(
              "F",
              style: TextStyle(
                  color: AppColors.errorColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ],
    );
  }
}
