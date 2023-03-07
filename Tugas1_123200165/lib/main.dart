import'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

@override
Widget build(BuildContext context) {
  return const Placeholder();
}


class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController passC = TextEditingController();
  bool pass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: login(),
    );
  }

  Padding login() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('images/logo_flutter.png', width: 50, height: 50,),
            padding: EdgeInsets.only(bottom: 50),
          ),
          TextField(
            autocorrect: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              labelText: 'Username',
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passC,
            autocorrect: false,
            obscureText: pass,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    if (pass == true) {
                      pass = false;
                    } else {
                      pass = true;
                    }
                  });
                },
              ),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 400,
            height: 35,
            child: ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                if (passC.text == 'password') {
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('password salah'),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ),
          TextButton(onPressed: (){},
            child: Text('Forgot Password?', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
