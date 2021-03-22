import 'package:flutter/material.dart';
import 'package:trivia_app/Helpers/helpers.dart';
import 'package:trivia_app/controllers/quiz/quiz_controller.dart';
import 'package:trivia_app/enums/difficulty.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trivia_app/repositories/quiz_repository.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD4418E), Color(0xFF0652C5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Text(
              'Trivia App',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.grey[200],
              height: 32.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
          ],
        ),
        bottomSheet: CustomButton(
          title: 'Start Quiz',
          onTap: () {
            context.read(quizControllerProvider).startQuiz();
          },
        ),
      ),
    );
  }
}
