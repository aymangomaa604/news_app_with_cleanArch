import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 5),
      () {
        GoRouter.of(context).push('/homeView');
      },
    );
    return Center(child: Image.asset('assets/news.png'));
  }
}
