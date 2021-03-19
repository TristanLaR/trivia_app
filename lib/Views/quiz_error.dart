import 'package:flutter/material.dart';
import 'package:trivia_app/Helpers/helpers.dart';
import 'package:trivia_app/repositories/quiz_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizError extends StatelessWidget {
  final String message;

  const QuizError({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 20.0),
        CustomButton(
          title: 'Retry',
          onTap: () => context.refresh(quizRepositoryProvider),
        )
      ]),
    );
  }
}