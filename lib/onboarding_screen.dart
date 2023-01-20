import 'package:flutter/material.dart';
import 'package:intern3/slider_layout_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(child: onBordingBody()),
    );
  }

  Widget onBordingBody() => const SliderLayoutView();
}
