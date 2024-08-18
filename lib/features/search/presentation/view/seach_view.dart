import 'package:flutter/material.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:news_app_with_cleanarch/features/search/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SearchViewBody()),
    );
  }
}
