import 'package:go_router/go_router.dart';

import 'package:task/features/home/presentatin/views/stock_items_view.dart';

class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: "HomeView",
      builder: (context, state) => const StockItemView(),
    ),
  ]);
}
