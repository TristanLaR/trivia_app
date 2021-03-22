import 'package:equatable/equatable.dart';
import 'package:trivia_app/models/question_model.dart';
import 'package:meta/meta.dart';

enum QuizStatus { start, initial, correct, incorrect, complete }

class QuizState extends Equatable {
  final String selectedAnswer;
  final List<Question> correct;
  final List<Question> incorrect;
  final QuizStatus status;

  bool get answered => 
    status == QuizStatus.correct || status == QuizStatus.incorrect;

  const QuizState({
    @required this.selectedAnswer,
    @required this.correct,
    @required this.incorrect,
    @required this.status,
  });

  factory QuizState.initial() {
    return QuizState(
      selectedAnswer: '',
      correct: [],
      incorrect: [],
      status: QuizStatus.initial,
    );
  }

  factory QuizState.start() {
    return QuizState(
      selectedAnswer: '',
      correct: [],
      incorrect: [],
      status: QuizStatus.start,
    );
  }

  @override
  List<Object> get props => [
    selectedAnswer,
    correct,
    incorrect,
    status,
  ];

  // Allows us to easily modify values in the Quiz State
  QuizState copyWith({
    String selectedAnswer,
    List<Question> correct,
    List<Question> incorrect,
    QuizStatus status,
  }) {
    return QuizState(
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      correct: correct ?? this.correct,
      incorrect: incorrect ?? this.incorrect,
      status: status ?? this.status,
    );
  }
}