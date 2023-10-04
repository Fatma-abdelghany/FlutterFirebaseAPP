import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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

            const TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name"
            ),
          ),
          const SizedBox(height: 20,),
              const TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email"
                ),
              ),
              const SizedBox(height: 20,),

          const TextField(
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
                onPressed: (){
                  setState(() {

                  });
                },
                child: const Text(
                    "Sign Up"
                )),
          ),

          Row(
            children: [
              Text("Don't Have An Account ?"),
              TextButton(onPressed: (){}, child: Text("Register"))
            ],
          )



          ],
        ),
      ),
    ),
    );
  }
}
