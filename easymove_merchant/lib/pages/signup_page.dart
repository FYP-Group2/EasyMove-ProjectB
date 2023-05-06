import 'package:easymove_merchant/pages/info_page.dart';
import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/login_page.dart';
import 'package:easymove_merchant/services/my_api_service.dart';

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
  final _saddressController = TextEditingController();

  String _selectedRegion = 'Select a Region';
  List<String> _regionList = ['Select a Region'];

  String _selectedZone = 'Select a Zone';
  List<String> _zoneList = ['Select a Zone'];

  Future<List<dynamic>> getZones() async {
    List<dynamic> data = await MyApiService.getZones();
    List<dynamic> zone = [];
    for (var z in data) {
      if(!zone.contains(z["zone"])) {
        zone.add(z["zone"]);
      }
    }
    return zone;
  }

  Future<List<dynamic>> getRegions() async {
    List<dynamic> data = await MyApiService.getRegions();
    return data[1];
  }

  @override
  void dispose() {
    _scompanyController.dispose();
    _semailController.dispose();
    _sbusinessController.dispose();
    _smobileController.dispose();
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
                    child: FutureBuilder(
                        future: getRegions(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            List<String> dataList = ["Select a Region"];
                            for (var d in snapshot.data!) {
                              if (!dataList.contains(d)) {
                                dataList.add(d);
                              }
                            }
                            _regionList = dataList;
                            return DropdownButtonFormField<String>(
                              isExpanded: true,
                              value: _selectedRegion.isNotEmpty? _selectedRegion : null,
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
                            );
                          } else {
                            return const Center(child:Text("Loading..."));
                          }
                        })),
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
                    child: FutureBuilder(
                        future: getZones(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            List<String> dataList = ["Select a Zone"];
                            for (var d in snapshot.data!) {
                              if (!dataList.contains(d)) {
                                dataList.add(d);
                              }
                            }
                            _zoneList = dataList;
                            return DropdownButtonFormField<String>(
                              isExpanded: true,
                              value: _selectedZone.isNotEmpty ? _selectedZone : null,
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
                            );
                          } else {
                            return const Center(child:Text("Loading..."));
                          }
                        })),
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
                        const Icon(
                          Icons.check_box_outline_blank_rounded,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: screenWidth - 100,
                          height: 40,
                          child: const Text(
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
                        print("---Sign up details\n"
                            "${_scompanyController.text}\n"
                            "${_semailController.text}\n"
                            "${_sbusinessController.text}\n"
                            "${_smobileController.text}\n"
                            "$_selectedRegion\n"
                            "$_selectedZone\n"
                            "${_saddressController.text}");
                        await MyApiService.merchantSignUp(_scompanyController.text, _semailController.text,
                            _sbusinessController.text, _smobileController.text, _selectedRegion,
                            _selectedZone, _saddressController.text)
                            .then((result){
                              if(result["result"] == true){
                                Navigator.of(context).push(PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder: (BuildContext context, _, __) =>
                                    const InfoPage(
                                        titleText: "Signup Successful",
                                        displayText:
                                        "Please be patient, we will contact you in a few days time",
                                        pageRoute: LoginPage())));
                              }else{
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8)),
                                          title: const Text("Signup failed"),
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
