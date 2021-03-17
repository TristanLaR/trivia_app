import 'package:trivia_app/models/question_model.dart';
import 'package:trivia_app/enums/difficulty.dart';


abstract class BaseQuizRepository {
  Future<List<Question>> getQuestions({
    int numQuestions,
    int categoryId,
    Difficulty difficulty,
  });
}
