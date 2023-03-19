import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/signup_page.dart';
import 'package:easymove_merchant/pages/menu_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginformKey = GlobalKey<FormState>();
  final _lemailController = TextEditingController();
  final _lpasswordController = TextEditingController();
  final _remailController = TextEditingController();

  @override
  void dispose() {
    _lemailController.dispose();
    _lpasswordController.dispose();
    _remailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: 218,
                  height: 217,
                ),
                Form(
                  key: _loginformKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0, right: 30.0, left: 30.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2)),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextFormField(
                            controller: _lemailController,
                            decoration: const InputDecoration(
                                label: Text("Email"),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16.0)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, right: 30.0, left: 30.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2)),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextFormField(
                            controller: _lpasswordController,
                            decoration: const InputDecoration(
                                label: Text("Password"),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16.0)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 250.0),
                        child: GestureDetector(
                          onTap: () async {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 500,
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Icon(Icons.error_rounded,
                                            color: Colors.red, size: 100),
                                        const SizedBox(height: 16.0),
                                        const Text(
                                          "Forgot Password",
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: SizedBox(
                                            width: 320,
                                            height: 40,
                                            child: Text(
                                              "Enter your email which is linked to your account to receive the link to reset password.",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0,
                                              right: 30.0,
                                              left: 30.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset:
                                                          const Offset(0, 2))
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            child: TextFormField(
                                              controller: _remailController,
                                              decoration: const InputDecoration(
                                                hintText: 'Email',
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.all(16),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter email';
                                                }
                                                return null; // change in future for when the email is not registered as a acc b4
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15.0),
                                        ElevatedButton(
                                          onPressed: () async {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text('Reset Link Sent'),
                                              backgroundColor: Colors.green,
                                              duration: Duration(seconds: 4),
                                            ));

                                            Future.delayed(
                                                    const Duration(seconds: 2))
                                                .then((_) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginPage(
                                                            title: "Login")),
                                              );
                                            });
                                          },
                                          style: ButtonStyle(
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    const Size(160, 40)),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            elevation: MaterialStateProperty
                                                .all<double>(8.0),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    const Color(0xFFB09A73)),
                                          ),
                                          child: const Text(
                                            "Receive Link",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3E3D3D)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, right: 30.0, left: 30.0),
                        child: Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MenuPage()),
                                );
                              },
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    const Size(165, 40)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                elevation: MaterialStateProperty.all<double>(8),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xFFB09A73)),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpPage(title: "Sign-Up")),
                                );
                              },
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    const Size(165, 40)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                elevation: MaterialStateProperty.all<double>(8),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xFFB09A73)),
                              ),
                              child: const Text(
                                "Sign-Up",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
