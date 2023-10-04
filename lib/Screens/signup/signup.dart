import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userName= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController Email= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             TextField(
              controller: userName,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name"
            ),
          ),
          const SizedBox(height: 20,),
               TextField(
                controller: Email,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email"
                ),
              ),
              const SizedBox(height: 20,),

           TextField(
             controller: password,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "password",

            ),
          ),
          const SizedBox(height: 20,),

          Container(
            width:double.infinity ,
            child: ElevatedButton(
                onPressed: ()async{
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: Email.text,
                        password: password.text
                    );
                    context.go("/home");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text(
                    "Sign Up"
                )),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Create Account"),
              TextButton(onPressed: (){context.go( "/login");}, child: Text("Login"))
            ],
          )



          ],
        ),
      ),
    ),
    );
  }
}
