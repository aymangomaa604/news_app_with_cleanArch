import 'package:go_router/go_router.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view/home_view.dart';
import 'package:news_app_with_cleanarch/features/search/presentation/view/seach_view.dart';
import 'package:news_app_with_cleanarch/features/splash/presentation/view/splash_view.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/searchView',
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
