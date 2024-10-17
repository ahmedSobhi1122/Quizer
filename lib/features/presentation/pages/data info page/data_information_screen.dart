import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_app_bar.dart';
import 'package:quizer/features/presentation/common/loading.dart';
import 'widgets/fields.dart';
import 'package:quizer/features/presentation/state/register_state.dart';

class DataInfoScreen extends StatelessWidget {
  const DataInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [

            BlocBuilder(builder: (context, state){
              if(state is RegisterLoading)
              {
                return const Loading();
              }
              else if(state is RegisterSuccess)
              {
                context.message(message: "success");
                context.pushReplacementNamed(Routes.homeScreenRoute);
              }
              return const Loading();
            }
            ),
            Background(
                  paddingRight: AppSize.s24,
                  paddingLeft: AppSize.s24,
                  paddingTop: AppSize.s50,
                  child: SingleChildScrollView(
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return Column(children: [
                  const CustomAppBar(
                    start: 3 / 2,
                    end: 1,
                  ),
                  SizedBox(height: AppSize.s40.h),
                  Text(
                    '''Create an account''',
                    style: AppTextStyles.headerSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s10.h),
                  Text(
                    '''Please complete your profile''',
                    style: AppTextStyles.subHeaderSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s90.h),
                  Fields(),
                ]);
              },
            ),
                  ),
                )
          ],
        ));
  }
}

