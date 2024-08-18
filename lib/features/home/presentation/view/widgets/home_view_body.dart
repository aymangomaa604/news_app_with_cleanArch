import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_with_cleanarch/core/utils/styles.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view/widgets/NewsListView.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view/widgets/custom_news_item.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view/widgets/news_listview_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ALL News',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(.5)),
                  child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).push('/searchView');
                      },
                      icon: Icon(Icons.search)))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: NewsListViewBlocBuilder()),
        ],
      ),
    );
  }
}

