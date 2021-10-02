import 'package:flutter/material.dart';
import 'package:login_app/models/auth.dart';
import 'package:login_app/routes/app_routes.dart';
import 'package:login_app/views/auth_of_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ct) => Auth(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        routes: {
          AppRoutes.AUTH_OF_HOME: (_) => AuthOrHomePage(),
        },
      ),
    );
  }
}
