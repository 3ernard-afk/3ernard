import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/constants/sizes.dart';
import '../../../../utils/animations/fade_in_animation/animation_design.dart';
import '../../../../utils/animations/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../utils/animations/fade_in_animation/fade_in_animation_model.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return SafeArea(
        child: Scaffold(
            body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1)
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
          child: Stack(
            children: [
              TFadeInAnimation(
                durationInMs: 1200,
                animate: TAnimatePosition(
                  topAfter: 0,
                  topBefore: -30,
                  leftBefore: -30,
                  leftAfter: 0,
                ),
                child: const Image(image: AssetImage(tSplashTopIcon)),
              ),
              TFadeInAnimation(
                durationInMs: 1600,
                animate: TAnimatePosition(
                  topBefore: 100,
                  topAfter: 100,
                  leftAfter: tDefaultSize,
                  leftBefore: -100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tAppName,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      tAppTagLine,
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
              ),
              TFadeInAnimation(
                durationInMs: 2000,
                animate: TAnimatePosition(bottomBefore: 0, bottomAfter: 100),
                child: const Image(image: AssetImage(tSplashImage)),
              ),
              TFadeInAnimation(
                  durationInMs: 2000,
                  animate: TAnimatePosition(
                      bottomBefore: 0,
                      bottomAfter: 60,
                      rightBefore: tDefaultSize,
                      rightAfter: tDefaultSize),
                  child: Container(
                    width: tSplashContainerSize,
                  ))
            ],
          ),
        ),
      ],
    )));
  }
}
