import 'package:dev_Quiz/challange/challange_page.dart';
import 'package:dev_Quiz/core/app_colors.dart';
import 'package:dev_Quiz/home/home_controller.dart';
import 'package:dev_Quiz/home/home_state.dart';
import 'package:dev_Quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_Quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_Quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePAgeState createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePage> {
  final hController = HomeController();

  @override
  void initState() {
    super.initState();
    hController.getUser();
    hController.getQuizzes();

    hController.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (hController.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(
          user: hController.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LevelButtonWidget(label: 'Fácil'),
                  LevelButtonWidget(label: 'Médio'),
                  LevelButtonWidget(label: 'Difícil'),
                  LevelButtonWidget(label: 'Perito'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  children: hController.quizzes!
                      .map(
                        (e) => QuizCardWidget(
                          title: e.title,
                          image: e.image,
                          progress:
                              '${e.questionsAnswered} de ${e.questions.length}',
                          percent: e.questionsAnswered / e.questions.length,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChallangePage(questions: e.questions,)));
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
