import 'package:dev_Quiz/challange/challange_controller.dart';
import 'package:dev_Quiz/challange/widgets/next_button/next_button_widget.dart';
import 'package:dev_Quiz/challange/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_Quiz/challange/widgets/quiz/quiz_widget.dart';
import 'package:dev_Quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallangePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallangePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallangePageState createState() => _ChallangePageState();
}

class _ChallangePageState extends State<ChallangePage> {
  final cController = ChallangeController();
  final pageController = PageController();

  void nextPage(){
    if(cController.currentPage < widget.questions.length)
      pageController.nextPage(duration: Duration(milliseconds: 200) , curve: Curves.easeIn);
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
            builder: (context, value, _) => cController.currentPage == widget.questions.length
                ? Expanded(child: NextButtonWidget.green(label: 'Confirmar', onTap: () => Navigator.pop(context)))
                : Row(
                  children: [
                    Expanded(child: NextButtonWidget.red(label: 'Sair', onTap: () => Navigator.pop(context),)),
                    SizedBox(width: 8),
                    Expanded(child: NextButtonWidget.white(label: 'Próximo', onTap: nextPage,)),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
