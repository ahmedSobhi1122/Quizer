import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerList extends StatelessWidget {
  final List<String> answers;
  final Function(int) onSelectAnswer;
  final Function(int) onDismissAnswer;
  final int? selectedAnswerIndex;

  const AnswerList({
    Key? key,
    required this.answers,
    required this.onSelectAnswer,
    required this.onDismissAnswer,
    this.selectedAnswerIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: answers.length * 65.h,
      width: double.infinity,
      child: ListView.builder(
        physics: const ScrollPhysics(),
        itemCount: answers.length,
        itemBuilder: (context, index) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 700),
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Dismissible(
                  key: Key(answers[index]),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) => onDismissAnswer(index),
                  child: GestureDetector(
                    onTap: () => onSelectAnswer(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedAnswerIndex == index
                            ? Colors.green[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedAnswerIndex == index
                              ? Colors.green
                              : Colors.transparent,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            answers[index],
                            style: const TextStyle(color: Colors.black),
                          ),
                          Icon(
                            selectedAnswerIndex == index
                                ? Icons.check_circle
                                : Icons.circle,
                            color: selectedAnswerIndex == index
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
