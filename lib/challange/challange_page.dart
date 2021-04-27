import 'package:dev_quiz/challange/challange_controller.dart';
import 'package:dev_quiz/challange/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/challange/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challange/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/result/result_page.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallangePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String quizTitle;

  const ChallangePage(
      {Key? key, required this.questions, required this.quizTitle})
      : super(key: key);

  @override
  ChallangePageState createState() => ChallangePageState();
}

class ChallangePageState extends State<ChallangePage> {
  final cController = ChallangeController();
  final pageController = PageController();

  void nextPage() {
    if (cController.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  @override
  void initState() {
    pageController.addListener(() {
      cController.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: ValueListenableBuilder<int>(
            valueListenable: cController.currentPageNotifier,
            builder: (context, value, _) => QuestionIndicatorWidget(
              currentPage: value,
              totalPages: widget.questions.length,
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions.map((e) => QuizWidget(question: e)).toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ValueListenableBuilder<int>(
            valueListenable: cController.currentPageNotifier,
            builder: (context, value, _) =>
                cController.currentPage == widget.questions.length
                    ? NextButtonWidget.green(
                        label: 'Confirmar',
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              quizTitle: widget.quizTitle,
                              totalQuestions: widget.questions.length,
                              result: ChallangeController.rightHits,
                            ),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: NextButtonWidget.red(
                              label: 'Sair',
                              onTap: () => Navigator.pop(context),
                            ),
                          ),
                          Expanded(
                            child: NextButtonWidget.white(
                              label: 'Próximo',
                              onTap: nextPage,
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
