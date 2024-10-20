import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/helper/image_handler.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/features/data_sources/models/question_model.dart';
import 'package:quizer/features/data_sources/models/quiz_model.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/button_back.dart';
import 'package:quizer/features/presentation/common/loading.dart';
import 'package:quizer/features/presentation/cubit/question_create_cubit.dart';
import 'package:quizer/features/presentation/pages/create%20question%20page/widgets/new_question_form.dart';
import 'package:quizer/features/presentation/state/question_create_state.dart';

class CreateQuestionScreen extends StatefulWidget {
  const CreateQuestionScreen({super.key});

  @override
  State<CreateQuestionScreen> createState() => _CreateQuestionScreenState();
}


class _CreateQuestionScreenState extends State<CreateQuestionScreen> {
  @override
  void initState() {
    quizModel = DataIntent.getQuizModel();
    super.initState();
  }
  QuizModel? quizModel;
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  int currentPageViewerIndex = 0; // wrap widgets with blocBuilder -

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            paddingRight: AppSize.s24,
            paddingLeft: AppSize.s24,
            paddingTop: AppSize.s20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonBack(
                      onPressed: () => context
                          .pushReplacementNamed(Routes.quizSettingScreenRoute),
                    ),
                    BlocBuilder<QuestionCubit, QuestionCreateState>(
                        builder: (context, state) {
                      return Text(
                        "${currentPageViewerIndex + 1}/${context.read<QuestionCubit>().questionCount()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.s22.sp,
                          color: MyTheme.textColor,
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(height: AppSize.s20.h),
                Expanded(
                  child: BlocBuilder<QuestionCubit, QuestionCreateState>(
                      builder: (context, state) {
                    return PageView.builder(
                      controller: PageController(initialPage: context.read<QuestionCubit>().questionCount() + 1),
                      itemCount: context.read<QuestionCubit>().questionCount() + 1, // Include one for the new question
                      onPageChanged: (index) {
                        context.read<QuestionCubit>().pageChanged();
                        currentPageViewerIndex = index;
                        print(context.read<QuestionCubit>().questionCount());
                      },
                      itemBuilder: (context, index) {
                        if (index == context.read<QuestionCubit>().questionCount()) {
                          return NewQuestionForm(
                              answerController: _answerController,
                              questionController: _questionController,
                          );
                        }
                        else {
                          return _buildQuestionView(context.read<QuestionCubit>().questions[index]);
                        }
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          BlocBuilder<QuestionCubit, QuestionCreateState>(builder: (context, state)
          {
            if (state is QuestionCreateLoading) {
              return const Loading();
            }
            else {
              return const SizedBox.shrink();
            }
          })
        ],
      ),
    );
  }
///TODO*-----------------------------------------------------------------------*


  Widget _buildQuestionView(QuestionModel question) {
    return Column(
      children: [
        Text(
          question.title!,
          style:
              TextStyle(fontSize: AppSize.s22.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: AppSize.s16.h,
        ),

        ClipRRect(
                   borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                    child: ImageManager(
                    height: AppSize.s250.h,
                    width: context.width,
                    url: question.imageFile!.path,
                    fit: BoxFit.cover,
                ),
                ),
        SizedBox(
          height: AppSize.s36.h,
        ),
        Text(
          "Answers Down Here:",
          style:
              TextStyle(fontSize: AppSize.s22.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: AppSize.s24.h,
        ),

        ...List.generate(question.answers!.length, (context) // sorry xD
            {
          return Padding(
            padding: EdgeInsets.all(AppPadding.p8.r),
            child: Text(question.answers![context].isRightAnswer!
                ? "${question.answers![context].content!} -> Right Answer"
                : question.answers![context].content!),
          );
        })
        // You can further display image and answers from questionData here
      ],
    );
  }
}