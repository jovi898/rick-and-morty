import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/config/app_colors.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';

class CircleBackButton extends StatelessWidget {
  static const double _borderRadius = 44;
  static const double _padding = 10;

  const CircleBackButton ({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(_borderRadius),
      color: AppColors.backButtonColorBg,
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {  
          context.pop();
        },
        child: Container(
          padding: EdgeInsets.all(_padding),
          child: SvgPicture.asset(
            Assets.images.arrowLeft.path,
          ),
        ),
      ),
    );
  }
}