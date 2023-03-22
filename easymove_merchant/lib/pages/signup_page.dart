import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signupformKey = GlobalKey<FormState>();
  final _scompanyController = TextEditingController();
  final _semailController = TextEditingController();
  final _sbusinessController = TextEditingController();
  final _smobileController = TextEditingController();
  final _sregionController = TextEditingController();
  final _szoneController = TextEditingController();
  final _saddressController = TextEditingController();

  String _selectedRegion = 'Select Region';
  final List<String> _regionList = [
    'Select Region',
    'region 1',
    'region 2',
  ];

  String _selectedZone = 'Select Zone';
  final List<String> _zoneList = [
    'Select Zone',
    'zone 1',
    'zone 2',
  ];

  @override
  void dispose() {
    _scompanyController.dispose();
    _semailController.dispose();
    _sbusinessController.dispose();
    _smobileController.dispose();
    _sregionController.dispose();
    _szoneController.dispose();
    _saddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: const Color(0xFFFFF8F0),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
            child: Text(
              'Apply a merchant account to get our delivery services.',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 30.0, left: 30.0),
            child: Form(
              key: _signupformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
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
                      controller: _scompanyController,
                      decoration: const InputDecoration(
                        label: Text("Company Name"),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company name required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
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
                      controller: _semailController,
                      decoration: const InputDecoration(
                        label: Text("Email"),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
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
                      controller: _sbusinessController,
                      decoration: const InputDecoration(
                        label: Text("Business Field"),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Business field required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2))
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black),
                        child: const Center(
                          child: Text(
                            "+60",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 60,
                        width: screenWidth - 140,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2))
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextFormField(
                          controller: _smobileController,
                          decoration: const InputDecoration(
                            label: Text("Mobile Number"),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mobile no. required';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Container(
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
                    child: DropdownButtonFormField<String>(
                      value: _selectedRegion,
                      items: _regionList
                          .map(
                            (region) => DropdownMenuItem<String>(
                              value: region,
                              child: Text(region),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedRegion = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Region',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
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
                    child: DropdownButtonFormField<String>(
                      value: _selectedZone,
                      items: _zoneList
                          .map(
                            (zone) => DropdownMenuItem<String>(
                              value: zone,
                              child: Text(zone),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedZone = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Zone',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    height: 100,
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
                      controller: _saddressController,
                      decoration: const InputDecoration(
                        label: Text("Company Address"),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company address required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.check_box_outline_blank_rounded,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: screenWidth - 100,
                          height: 40,
                          child: Text(
                            "I agree to the Privacy Policy, Terms and Conditions.",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoginPage(title: "Login")),
                        );
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(screenWidth - 60, 40)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(8),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFB09A73)),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
