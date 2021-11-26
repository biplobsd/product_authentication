import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_authentication/bloc/qrbloc_bloc.dart';
import 'package:product_authentication/config/theme_config/AppTheme.dart';
import 'package:product_authentication/config/theme_config/ThemeModel.dart';
import 'package:provider/provider.dart';

import 'config/strings.dart';
import 'widgets/qr_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (BuildContext context) => ThemeModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QRBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings['AppName'],
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        home: QRHome(title: AppStrings['AppName']),
      ),
    );
  }
}
