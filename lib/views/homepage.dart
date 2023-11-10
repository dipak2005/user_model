import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exam/views/util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

TextEditingController namecontroller = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController addresscontroller = TextEditingController();
String Gender = "";
String selectname = "rajkot";

class _HomepageState extends State<Homepage> {
  String? filepath;
  String? maritualstatus;
  int? dropdown;
  String? selectcat;
  bool iscreate = false;
  bool iscolor = false;
  bool isvalid = false;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isfont = false;

  void User_add() {
    String fname = namecontroller.text;
    String phone = phonecontroller.text;
    String address = addresscontroller.text;
    String city = selectname;
    String gender = Gender;

    if (fname.isNotEmpty &&
        address.isNotEmpty &&
        phone.isNotEmpty &&
        city.isNotEmpty &&
        gender.isNotEmpty) {
      setState(() {
        Userlist.add(
          User(
              fname: fname,
              phone: phone,
              address: address,
              city: city,
              gender: gender),
        );
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User profile",
          style: GoogleFonts.alike(
              fontWeight: FontWeight.w600, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Exit"),
                    content: Container(
                      child: Text(
                        "are you want to exit",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "No",
                            style: TextStyle(fontSize: 20),
                          )),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "yes",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.arrow_back_ios)),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.9, 0.9),
                            blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("create User profile",
                              style: GoogleFonts.alike(
                                  fontWeight: FontWeight.w600, fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Switch(
                            value: iscreate,
                            onChanged: (value) {
                              iscreate = !iscreate;
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (iscreate)
                  Column(
                    children: [
                      Center(
                        child: Form(
                          key: globalKey,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.9, 0.9),
                                      blurRadius: 10),
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 80,
                                      backgroundImage: filepath != null
                                          ? FileImage(File(filepath ?? ""))
                                          : null,
                                      child: IconButton(
                                        onPressed: () {
                                          pickImage(true);
                                          iscolor = !iscolor;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.camera_alt,
                                          color: iscolor
                                              ? Colors.transparent
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 38.0, right: 38, top: 10),
                                  child: TextFormField(
                                    controller: namecontroller,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.person),
                                        label: Text("Enter User name"),
                                        hintText: "Enter User name",
                                        filled: true,
                                        fillColor: Colors.black12),
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return "* please enter your name";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 38.0, right: 38, top: 10),
                                  child: TextFormField(
                                    controller: phonecontroller,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.phone),
                                        label: Text("Enter User phone number"),
                                        hintText: "Enter User phone number",
                                        filled: true,
                                        fillColor: Colors.black12),
                                    validator: (value) {
                                      var intvalue = int.tryParse(value!);
                                      if (intvalue == null) {
                                        return "*please enter mobile";
                                      } else if ((value.length) != 10) {
                                        return "*please enter 10 digits";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 38.0, right: 38, top: 10),
                                  child: TextFormField(
                                    controller: addresscontroller,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.home),
                                        label: Text("Enter User address"),
                                        hintText: "Enter User address",
                                        filled: true,
                                        fillColor: Colors.black12),
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return "*please enter your address";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: RadioListTile(
                                    value: "single",
                                    groupValue: maritualstatus,
                                    onChanged: (value) {
                                      maritualstatus = value;
                                      Gender = "single";
                                      // singlecontroller =
                                      // value as TextEditingController;
                                      setState(() {});
                                    },
                                    title: Text(
                                      "single",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: RadioListTile(
                                    value: "Married",
                                    groupValue: maritualstatus,
                                    onChanged: (value) {
                                      maritualstatus = value;
                                      Gender = "male";
                                      setState(() {});
                                    },
                                    title: Text(
                                      "Married",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "City",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    DropdownButton(
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("Rajkot"),
                                          value: 0,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("Surat"),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("ahmedabad"),
                                          value: 2,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("amreli"),
                                          value: 3,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("vadodra"),
                                          value: 4,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("jamnagar"),
                                          value: 5,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("junagadh"),
                                          value: 6,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("somnath"),
                                          value: 7,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("mehsana"),
                                          value: 8,
                                        ),
                                      ],
                                      hint: Text("Select your city"),
                                      value: dropdown,
                                      onChanged: (value) {
                                        dropdown = value;
                                        // citycontroller =
                                        //     value as TextEditingController;
                                        // Map<String, dynamic> cl =
                                        //     citylist[value??0];
                                        // selectcat = cl["name"];
                                        setState(() {});
                                      },
                                    ),
                                    if (dropdown != null)
                                      ActionChip(
                                        label: Text("Clear"),
                                        onPressed: () {
                                          dropdown = null;
                                          setState(() {});
                                        },
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        bool isvalied = globalKey.currentState
                                                ?.validate() ??
                                            true;
                                        if (isvalied) {
                                          globalKey.currentState?.save();

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Container(
                                                child:
                                                    Text("Saved successfully"),
                                              ),
                                            ),
                                          );
                                          User_add();
                                        } else {
                                          print("invalied");
                                        }
                                      },
                                      child: Text("Save"),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        globalKey.currentState?.reset();
                                        namecontroller.clear();
                                        addresscontroller.clear();
                                        phonecontroller.clear();
                                        dropdown = null;
                                        maritualstatus = "";
                                        setState(() {});
                                      },
                                      child: Text("Reset"),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "Secondpage");
                                      },
                                      child: Text("Next"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void pickImage(bool iscamara) async {
    XFile? file = await ImagePicker()
        .pickImage(source: iscamara ? ImageSource.camera : ImageSource.gallery);
    filepath = file?.path;
    setState(() {});
  }
}
