import 'package:dev_Quiz/core/app_images.dart';
import 'package:dev_Quiz/home/home_repository.dart';
import 'package:dev_Quiz/home/home_state.dart';
import 'package:dev_Quiz/shared/models/answer_model.dart';
import 'package:dev_Quiz/shared/models/question_model.dart';
import 'package:dev_Quiz/shared/models/quiz_model.dart';
import 'package:dev_Quiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty) ;
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final hRepository = HomeRepository();

  void getUser() async{
    state = HomeState.loading;
    user = await hRepository.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async{
    state = HomeState.loading;
    quizzes = await hRepository.getQuizzes();
    state = HomeState.sucess;
  }
}
