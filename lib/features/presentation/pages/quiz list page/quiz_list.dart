import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/extensions.dart';
import '../../../../config/routes/route_constants.dart';
import '../../../../core/resources/app_values.dart';

class CustomCardItem extends StatelessWidget {
  final String userName;
  final int questionCount;
  final String authorName;
  final VoidCallback onTap; // Add onTap callback

  const CustomCardItem({
    super.key,
    required this.userName,
    required this.questionCount,
    required this.authorName,
    required this.onTap, // Accept onTap as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call onTap when tapped
      child: SizedBox(
        width: AppSize.s390.w,
        height: AppSize.s130.h,
        child: Card(
          color: MyTheme.disabledColor,
          child: Row(
            children: [
              Container(
                width: AppSize.s130.w,
                height: AppSize.s130.h,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Placeholder(),
              ),
              SizedBox(width: AppSize.s10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: MyTheme.textColor,
                      ),
                    ),
                    Text(
                      "$questionCount Questions",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: MyTheme.textColor,
                      ),
                    ),
                    SizedBox(height: AppSize.s10.h),
                    Row(
                      children: [
                        const Icon(Icons.person, color: MyTheme.textColor),
                        SizedBox(width: AppSize.s4.w),
                        Text(
                          authorName,
                          style: const TextStyle(
                            fontSize: 10,
                            color: MyTheme.textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example of using CustomCardItem in a parent widget
class QuizListScreen extends StatefulWidget {
  const QuizListScreen({Key? key}) : super(key: key);

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  final List<Map<String, dynamic>> quizzes = List.generate(
    9,
    (index) => {
      "userName": 'Material Quiz $index',
      "questionCount": 15,
      "authorName": 'Author $index',
    },
  );

  void _startSearch(BuildContext context) {
    showSearch(
      context: context,
      delegate: QuizSearchDelegate(quizzes: quizzes),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.backgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: MyTheme.textColor),
        ),
        title: const Text(
          "Education",
          style: TextStyle(color: MyTheme.textColor),
        ),
        actions: [
          IconButton(
            onPressed: () => _startSearch(context),
            icon: const Icon(Icons.search, color: MyTheme.textColor),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // Placeholder Container
            Container(
              width: AppSize.s390.w,
              height: AppSize.s130.h,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Placeholder(),
            ),
            const SizedBox(height: 15),
            // ListView inside Expanded
            Expanded(
              child: ListView.builder(
                itemCount: quizzes.length,
                itemBuilder: (context, index) {
                  return CustomCardItem(
                    userName: quizzes[index]["userName"],
                    questionCount: quizzes[index]["questionCount"],
                    authorName: quizzes[index]["authorName"],
                    onTap: () {
                      // Use context.pushNamed for navigation
                      context.pushNamed(Routes.startQuizScreenRoute);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Implementing QuizSearchDelegate
class QuizSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, dynamic>> quizzes;

  QuizSearchDelegate({required this.quizzes});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Define what happens when the search is submitted
    return Container(); // Customize as required
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredQuizzes = quizzes.where((quiz) {
      return quiz["userName"].toLowerCase().contains(query.toLowerCase()) ||
          quiz["authorName"].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredQuizzes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredQuizzes[index]["userName"]),
          onTap: () {
            query = filteredQuizzes[index]["userName"];
            showResults(context);
          },
        );
      },
    );
  }
}
