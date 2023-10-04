import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/Screens/Home/home.dart';
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

   @override
   void initState(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('******User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
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
      GoRoute(
        path: '/home',
        builder: ( context,  state) =>Home(),

      ),

    ]

);

