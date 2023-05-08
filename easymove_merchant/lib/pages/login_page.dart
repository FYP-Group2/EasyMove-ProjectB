// import 'package:easymove_merchant/models/merchant.dart';
// import 'package:easymove_merchant/pages/product_listing.dart';
// import 'package:easymove_merchant/services/firebase_messaging_service.dart';
// import 'package:easymove_merchant/services/my_api_service.dart';
// import 'package:flutter/material.dart';
// import 'package:easymove_merchant/pages/signup_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _loginformKey = GlobalKey<FormState>();
//   final _lemailController = TextEditingController();
//   final _lpasswordController = TextEditingController();
//   final _remailController = TextEditingController();
//   Merchant merchant = Merchant();

//   void autoLogin() async {
//     Future.delayed(const Duration(seconds: 3)).then(
//       (value) async => await SharedPreferences.getInstance().then((value) {
//         if (value.getString("email") != null &&
//             value.getString("email") != "" &&
//             value.getString("password") != null &&
//             value.getString("password") != "") {
//           String email = value.getString("email")!;
//           String password = value.getString("password")!;
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                     title: const Text("Last login detected"),
//                     content: Text("Proceed to login as $email ?"),
//                     actions: [
//                       TextButton(
//                         onPressed: () async {
//                           await merchantLogin(email, password)
//                               .then((result) async {
//                             if (result["result"] == true) {
//                               await SharedPreferences.getInstance()
//                                   .then((value) {
//                                 value.setString(
//                                     "email", _lemailController.text);
//                                 value.setString(
//                                     "password", _lpasswordController.text);
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const productPage()),
//                                 );
//                               });
//                             } else {
//                               showDialog(
//                                   context: context,
//                                   builder: (context) {
//                                     return AlertDialog(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8)),
//                                         title: const Text("Login failed"),
//                                         //myAlertBoxTitle(action),
//                                         content: Text("${result["message"]}"),
//                                         actions: [
//                                           TextButton(
//                                             onPressed: () {
//                                               Navigator.of(context).pop(false);
//                                               setState(() {});
//                                             },
//                                             child: const Text(
//                                               "Ok",
//                                               style: TextStyle(
//                                                 fontSize: 20,
//                                               ),
//                                             ),
//                                           ),
//                                         ]);
//                                   });
//                             }
//                           });
//                         },
//                         child: const Text(
//                           "Yes",
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context).pop(false);
//                           setState(() {});
//                         },
//                         child: const Text(
//                           "No",
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ]);
//               });
//         }
//       }),
//     );
//   }

//   Future<Map<String, dynamic>> merchantLogin(
//       String username, String password) async {
//     Map<String, dynamic> result = {"result": false};
//     final data = await MyApiService.merchantLogIn(username, password);
//     if (data["result"] == true) {
//       result["result"] = true;
//       FirebaseMessagingService firebaseMessagingService = FirebaseMessagingService();
//       String token = firebaseMessagingService.getFcmToken();
//       merchant.initializeMerchant(
//           data["id"],
//           data["region"],
//           data["company"],
//           data["branch"],
//           data["branch_location"],
//           data["branch_location_coordinate"],
//           token);

//       await MyApiService.updateToken(merchant.id, merchant.fcmToken);
//     } else {
//       result["message"] = data["message"];
//     }
//     return result;
//   }

//   @override
//   void initState() {
//     super.initState();
//     autoLogin();
//   }

//   @override
//   void dispose() {
//     _lemailController.dispose();
//     _lpasswordController.dispose();
//     _remailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Stack(
//       children: [
//         Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: Theme.of(context).primaryColor,
//           body: Center(
//               child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset(
//                   'assets/images/logo.png',
//                   width: 218,
//                   height: 217,
//                 ),
//                 Form(
//                   key: _loginformKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             top: 50.0, right: 30.0, left: 30.0),
//                         child: Container(
//                           height: 60,
//                           decoration: BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black.withOpacity(0.5),
//                                     spreadRadius: 2,
//                                     blurRadius: 5,
//                                     offset: const Offset(0, 2)),
//                               ],
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.white),
//                           child: TextFormField(
//                             controller: _lemailController,
//                             decoration: const InputDecoration(
//                                 label: Text("Email"),
//                                 border: InputBorder.none,
//                                 contentPadding: EdgeInsets.all(16.0)),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter email';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             top: 15.0, right: 30.0, left: 30.0),
//                         child: Container(
//                           height: 60,
//                           decoration: BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black.withOpacity(0.5),
//                                     spreadRadius: 2,
//                                     blurRadius: 5,
//                                     offset: const Offset(0, 2)),
//                               ],
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.white),
//                           child: TextFormField(
//                             controller: _lpasswordController,
//                             decoration: const InputDecoration(
//                                 label: Text("Password"),
//                                 border: InputBorder.none,
//                                 contentPadding: EdgeInsets.all(16.0)),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter password';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10.0, right: 30.0),
//                         child: GestureDetector(
//                           onTap: () async {
//                             showModalBottomSheet(
//                                 isScrollControlled: true,
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return SingleChildScrollView(
//                                       child: Container(
//                                     height: 450,
//                                     color: Colors.white,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         const Icon(Icons.error_rounded,
//                                             color: Colors.red, size: 100),
//                                         const SizedBox(height: 16.0),
//                                         const Text(
//                                           "Forgot Password",
//                                           style: TextStyle(
//                                             fontSize: 35,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         const Padding(
//                                           padding: EdgeInsets.only(
//                                               top: 10.0,
//                                               left: 30.0,
//                                               right: 30.0),
//                                           child: SizedBox(
//                                             height: 40,
//                                             child: Text(
//                                               "A reset password link will send to the registered email.",
//                                               style: TextStyle(
//                                                   fontSize: 15,
//                                                   color: Colors.black),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(height: 20.0),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 10.0,
//                                               right: 30.0,
//                                               left: 30.0),
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                       color: Colors.black
//                                                           .withOpacity(0.5),
//                                                       spreadRadius: 2,
//                                                       blurRadius: 5,
//                                                       offset:
//                                                           const Offset(0, 2))
//                                                 ],
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 color: Colors.white),
//                                             child: TextFormField(
//                                               controller: _remailController,
//                                               decoration: const InputDecoration(
//                                                 hintText: 'Email',
//                                                 border: InputBorder.none,
//                                                 contentPadding:
//                                                     EdgeInsets.all(16),
//                                               ),
//                                               validator: (value) {
//                                                 if (value == null ||
//                                                     value.isEmpty) {
//                                                   return 'Please enter email';
//                                                 }
//                                                 return null; // change in future for when the email is not registered as a acc b4
//                                               },
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(height: 15.0),
//                                         ElevatedButton(
//                                           onPressed: () async {
//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(const SnackBar(
//                                               content: Text('Reset Link Sent'),
//                                               backgroundColor: Colors.green,
//                                               duration: Duration(seconds: 4),
//                                             ));

//                                             Future.delayed(
//                                                     const Duration(seconds: 2))
//                                                 .then((_) {
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         const LoginPage()),
//                                               );
//                                             });
//                                           },
//                                           style: ButtonStyle(
//                                             minimumSize:
//                                                 MaterialStateProperty.all(
//                                                     const Size(160, 40)),
//                                             shape: MaterialStateProperty.all<
//                                                 RoundedRectangleBorder>(
//                                               RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                               ),
//                                             ),
//                                             elevation: MaterialStateProperty
//                                                 .all<double>(8.0),
//                                             backgroundColor:
//                                                 MaterialStateProperty.all<
//                                                         Color>(
//                                                     const Color(0xFFB09A73)),
//                                           ),
//                                           child: const Text(
//                                             "Receive Link",
//                                             style: TextStyle(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ));
//                                 });
//                           },
//                           child: const Text(
//                             "Forgot Password?",
//                             textAlign: TextAlign.right,
//                             style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF3E3D3D)),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             top: 30.0, right: 30.0, left: 30.0),
//                         child: Row(
//                           children: <Widget>[
//                             ElevatedButton(
//                               onPressed: () async {
//                                 await merchantLogin(_lemailController.text,
//                                         _lpasswordController.text)
//                                     .then((result) async {
//                                   if (result["result"] == true) {
//                                     await SharedPreferences.getInstance()
//                                         .then((value) {
//                                       value.setString(
//                                           "email", _lemailController.text);
//                                       value.setString("password",
//                                           _lpasswordController.text);
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const productPage()),
//                                       );
//                                     });
//                                   } else {
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return AlertDialog(
//                                               shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(8)),
//                                               title: const Text("Login failed"),
//                                               //myAlertBoxTitle(action),
//                                               content:
//                                                   Text("${result["message"]}"),
//                                               actions: [
//                                                 TextButton(
//                                                   onPressed: () {
//                                                     Navigator.of(context)
//                                                         .pop(false);
//                                                     setState(() {});
//                                                   },
//                                                   child: const Text(
//                                                     "Ok",
//                                                     style: TextStyle(
//                                                       fontSize: 20,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ]);
//                                         });
//                                   }
//                                 });
//                               },
//                               style: ButtonStyle(
//                                 minimumSize: MaterialStateProperty.all(
//                                     Size(screenWidth - 246, 40)),
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(10.0))),
//                                 elevation: MaterialStateProperty.all<double>(8),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         const Color(0xFFB09A73)),
//                               ),
//                               child: const Text(
//                                 "Login",
//                                 style: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             const SizedBox(width: 20),
//                             ElevatedButton(
//                               onPressed: () async {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const SignUpPage(title: "Sign-Up")),
//                                 );
//                               },
//                               style: ButtonStyle(
//                                 minimumSize: MaterialStateProperty.all(
//                                     Size(screenWidth - 246, 40)),
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(10.0))),
//                                 elevation:
//                                     MaterialStateProperty.all<double>(8.0),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         const Color(0xFFB09A73)),
//                               ),
//                               child: const Text(
//                                 "Sign-Up",
//                                 style: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )),
//         )
//       ],
//     );
//   }
// }


import 'package:easymove_merchant/models/merchant.dart';
import 'package:easymove_merchant/pages/product_listing.dart';
import 'package:easymove_merchant/services/firebase_messaging_service.dart';
import 'package:easymove_merchant/services/my_api_service.dart';
import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginformKey = GlobalKey<FormState>();
  final _lemailController = TextEditingController();
  final _lpasswordController = TextEditingController();
  final _remailController = TextEditingController();
  Merchant merchant = Merchant();

  void autoLogin() async {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) async => await SharedPreferences.getInstance().then((value) {
        if (value.getString("email") != null &&
            value.getString("email") != "" &&
            value.getString("password") != null &&
            value.getString("password") != "") {
          String email = value.getString("email")!;
          String password = value.getString("password")!;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    title: const Text("Last login detected"),
                    content: Text("Proceed to login as $email ?"),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await merchantLogin(email, password)
                              .then((result) async {
                            if (result["result"] == true) {
                              await SharedPreferences.getInstance()
                                  .then((value) {
                                value.setString(
                                    "email", _lemailController.text);
                                value.setString(
                                    "password", _lpasswordController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const productPage()),
                                );
                              });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        title: const Text("Login failed"),
                                        //myAlertBoxTitle(action),
                                        content: Text("${result["message"]}"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                              setState(() {});
                                            },
                                            child: const Text(
                                              "Ok",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ]);
                                  });
                            }
                          });
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                          setState(() {});
                        },
                        child: const Text(
                          "No",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ]);
              });
        }
      }),
    );
  }

  Future<Map<String, dynamic>> merchantLogin(
      String username, String password) async {
    Map<String, dynamic> result = {"result": false};
    final data = await MyApiService.merchantLogIn(username, password);
    if (data["result"] == true) {
      result["result"] = true;
      FirebaseMessagingService firebaseMessagingService = FirebaseMessagingService();
      String token = firebaseMessagingService.getFcmToken();
      merchant.initializeMerchant(
          data["id"],
          data["region"],
          data["company"],
          data["branch"],
          data["branch_location"],
          data["branch_location_coordinate"],
          token);

      await MyApiService.updateToken(merchant.id, merchant.fcmToken);
    } else {
      result["message"] = data["message"];
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  @override
  void dispose() {
    _lemailController.dispose();
    _lpasswordController.dispose();
    _remailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).primaryColor,
          body: Center(
              child: SingleChildScrollView(
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
                        padding: const EdgeInsets.only(top: 10.0, right: 30.0),
                        child: GestureDetector(
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      content: SingleChildScrollView(
                                          child: Container(
                                            height: 500,
                                            color: Colors.white,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                const Icon(
                                                    Icons.error_rounded,
                                                    color: Colors.red,
                                                    size: 90),
                                                const SizedBox(height: 16.0),
                                                const Text(
                                                  "Forgot Password",
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 10.0),
                                                  child: SizedBox(
                                                    height: 40,
                                                    child: Text(
                                                      "A reset password link will send to the registered email.",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 20.0),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.black.withOpacity(0.5),
                                                              spreadRadius: 2,
                                                              blurRadius: 5,
                                                              offset: const Offset(0, 2))
                                                        ],
                                                        borderRadius: BorderRadius.circular(10),
                                                        color: Colors.white
                                                    ),
                                                    child: TextFormField(
                                                      controller: _remailController,
                                                      decoration: const InputDecoration(
                                                        hintText: 'Registered Email',
                                                        border: InputBorder.none,
                                                        contentPadding: EdgeInsets.all(16),
                                                      ),
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Please enter email';
                                                        }
                                                        return null; // change in future for when the email is not registered as a acc b4
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10.0),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                      content: Text('Reset Link Sent'),
                                                      backgroundColor: Colors.green,
                                                      duration: Duration(seconds: 4),
                                                    ));
                                                    Future.delayed(const Duration(seconds: 2)).then((_) {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => const LoginPage()),
                                                      );
                                                    });
                                                  },
                                                  style: ButtonStyle(
                                                    minimumSize: MaterialStateProperty.all(const Size(160, 40)),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10)
                                                        )
                                                    ),
                                                    elevation: MaterialStateProperty.all<double>(8.0),
                                                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF000000)),
                                                  ),
                                                  child: const Text(
                                                    "Send Link",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10.0),
                                                GestureDetector(
                                                  onTap: () async {
                                                    Future.delayed(const Duration(seconds: 2)).then((_) {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => const LoginPage()),
                                                      );
                                                    });
                                                  },
                                                  child: const Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                        decoration: TextDecoration.underline
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                      )
                                  );
                                }
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
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
                                await merchantLogin(_lemailController.text,
                                        _lpasswordController.text)
                                    .then((result) async {
                                  if (result["result"] == true) {
                                    await SharedPreferences.getInstance()
                                        .then((value) {
                                      value.setString(
                                          "email", _lemailController.text);
                                      value.setString("password",
                                          _lpasswordController.text);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const productPage()),
                                      );
                                    });
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              title: const Text("Login failed"),
                                              //myAlertBoxTitle(action),
                                              content:
                                                  Text("${result["message"]}"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(false);
                                                    setState(() {});
                                                  },
                                                  child: const Text(
                                                    "Ok",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ]);
                                        });
                                  }
                                });
                              },
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(screenWidth - 246, 40)),
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
                                    Size(screenWidth - 246, 40)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                elevation:
                                    MaterialStateProperty.all<double>(8.0),
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
          )),
        )
      ],
    );
  }
}
