import 'package:dev_Quiz/core/app_colors.dart';
import 'package:dev_Quiz/core/app_gradients.dart';
import 'package:dev_Quiz/core/app_text_styles.dart';
import 'package:dev_Quiz/home/widgets/score_card/score_card_widget.dart';
import 'package:dev_Quiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: 161,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Olá, ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: 'Gabriel',
                              style: AppTextStyles.titleBold,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://avatars.githubusercontent.com/u/57967676?v=4'),
                            )),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment(0.0, 1.0),
                    child: ScoreCardWidget()),
              ],
            ),
          ),
        );
}
