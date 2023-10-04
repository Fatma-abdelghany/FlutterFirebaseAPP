import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/Screens/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfirebaseapp/Screens/signup/signup.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: routes,

    );
  }
}
GoRouter routes=GoRouter(
  initialLocation: "/login",
    routes: [
    GoRoute(
    path: '/login',
    builder: ( context,  state) =>LoginScreen(),

    ),
      GoRoute(
        path: '/signUp',
        builder: ( context,  state) =>SignUp(),

      ),

    ]

);

