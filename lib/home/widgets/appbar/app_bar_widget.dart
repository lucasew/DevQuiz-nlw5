import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../score_card/score_card_widget.dart';
import '../../../shared/models/models.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final double grade;
  AppBarWidget({required this.user, required this.grade})
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    height: 161,
                    width: double.maxFinite,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(
                              text: "Olá, ",
                              style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                    text: user.name,
                                    style: AppTextStyles.titleBold)
                              ])),
                          Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(user.photoUrl)))),
                        ])),
                Align(alignment: Alignment(0, 1), child: ScoreCardWidget(grade: grade))
              ]),
            ));
}
