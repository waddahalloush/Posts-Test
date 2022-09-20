import 'package:flutter/material.dart';
import 'package:post_test/core/utils/app_colors.dart';
import 'package:post_test/core/utils/app_router.dart';
import 'package:post_test/core/utils/app_strings.dart';
import 'package:post_test/models/post_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => PostProvider(),
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBG,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: AppColors.fab),
              
          primaryColor: AppColors.primary,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.homePost,
      ),
    );
  }
}
