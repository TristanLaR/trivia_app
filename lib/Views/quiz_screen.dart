import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trivia_app/Helpers/helpers.dart';
import 'package:trivia_app/Views/home_screen.dart';
import 'package:trivia_app/Views/quiz_error.dart';
import 'package:trivia_app/Views/quiz_questions.dart';
import 'package:trivia_app/Views/quiz_results.dart';
import 'package:trivia_app/controllers/quiz/quiz_controller.dart';
import 'package:trivia_app/controllers/quiz/quiz_state.dart';
import 'package:trivia_app/data/difficulty.dart';
import 'package:trivia_app/models/failure_model.dart';
import 'package:trivia_app/models/question_model.dart';
import 'package:trivia_app/repositories/quiz_repository.dart';

final quizQuestionsProvider = FutureProvider.autoDispose<List<Question>>(
  (ref) => ref.watch(quizRepositoryProvider).getQuestions(
        numQuestions: 5,
        categoryId: Random().nextInt(24) + 9,
        difficulty: Difficulty.easy,
      ),
);

class ScreenController extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
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
        body: _buildBody(context, pageController),
        bottomSheet: _bottomsheet(context, pageController),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    PageController pageController,
    //List<Question> questions,
  ) {
    final quizState = useProvider(quizControllerProvider.state);

    if (quizState.status == QuizStatus.start) return HomeScreen();

    final quizQuestions = useProvider(quizQuestionsProvider);
    if (quizQuestions.data == null)
      return QuizError(message: 'No Questions found.');
    if (quizState.status == QuizStatus.complete)
      return QuizResults(state: quizState, questions: quizQuestions.data.value);

    return quizQuestions.when(
      data: (questions) => QuizQuestions(
          pageController: pageController,
          state: quizState,
          questions: questions),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => QuizError(
        message: error is Failure ? error.message : 'Something went wrong!',
      ),
    );
  }

  Widget _bottomsheet(
    BuildContext context,
    PageController pageController,
  ) {
    final quizQuestions = useProvider(quizQuestionsProvider);

    return quizQuestions.maybeWhen(
      data: (questions) {
        final quizState = useProvider(quizControllerProvider.state);
        if (!quizState.answered) return const SizedBox.shrink();
        return CustomButton(
          title: pageController.page.toInt() + 1 < questions.length
              ? 'Next Question'
              : 'See Results',
          onTap: () {
            context
                .read(quizControllerProvider)
                .nextQuestion(questions, pageController.page.toInt());
            if (pageController.page.toInt() + 1 < questions.length) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 250),
                curve: Curves.linear,
              );
            }
          },
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
