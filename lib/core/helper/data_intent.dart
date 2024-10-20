import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/features/data_sources/models/quiz_model.dart';
import 'package:quizer/features/domain/entities/quiz.dart';

class DataIntent {
  DataIntent._();

//------------------------------------
  //login to forget password
  static String? _email;

  static void pushEmail(String email) => _email = email;

  static String? popEmail() {
    String? value = _email;
    _email = null;
    return value;
  }

//------------------------------------
  // login-register to All Screens
  static String? _userID;
  static UserRole? _userRole;
  static String? _token;

  static void pushUserID(String userID) {
    _userID = userID;
  }

  static void pushUserRole(UserRole userRole) {
    _userRole = userRole;
  }

  static void pushToken(String token) {
    _token = token;
  }

  static String? getUserID() {
    return _userID;
  }

  static UserRole? getUserRole() {
    return _userRole;
  }

  static String? getToken() {
    return _token;
  }
  //------------------------------------
  // Home To Start Quiz
  static int? _quizID;

  static void pushQuizID(int? quizID) {
    _quizID = quizID;
  }

  static int? getQuizID() {
    return _quizID;
  }
//------------------------------------
  // Start Quiz To Game
  static Quiz? _quiz;

  static void pushQuiz(Quiz quiz) {
    _quiz = quiz;
  }

  static void popQuiz() {
    _quiz = null;
  }

  static Quiz? getQuiz() {
    return _quiz;
  }

//------------------------------------
  // Quiz Setting to Question Setting
  static QuizModel? _quizModel;

  static void pushQuizModel(QuizModel quizModel) {
    _quizModel = quizModel;
  }

  static void popQuizModel() {
    _quizModel = null;
  }

  static QuizModel? getQuizModel() {
    return _quizModel;
  }


//------------------------------------
  ///profile data
  static String? _firstName;
  static String? _lastName;
  static String? _description;

  static void pushProfileData({
    String? firstName,
    String? lastName,
    String? description,
    String? profileImage,
    String? coverImage,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _description = description;
  }

  static String? getFirstName() => _firstName;
  static String? getLastName() => _lastName;
  static String? getDescription() => _description;
//------------------------------------
}
