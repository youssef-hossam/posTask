import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/core/utils/app_router.dart';
import 'package:task/core/utils/constant.dart';
import 'package:task/features/home/data/models/item_model.dart';
import 'package:task/features/home/presentatin/manger/item/item_cubit.dart';
import 'package:task/features/home/presentatin/manger/quantityselector/quantityselector_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MenuItemModelAdapter());
  await Hive.openBox<MenuItemModel>(kStockBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemCubit(),
        ),
        BlocProvider(
          create: (context) => QuantitySelectorCubit(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
