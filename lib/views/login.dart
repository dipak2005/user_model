import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> gkey = GlobalKey<FormState>();
  bool isvalied = false;
TextEditingController idcontroller=TextEditingController();
TextEditingController passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: GoogleFonts.roboto(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 25),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Plz give your Review",
                    style: GoogleFonts.alike(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  content: Container(
                    // height: MediaQuery.sizeOf(context).height*0.2,
                    child: RatingBar.builder(
                      initialRating: 3,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red,
                            );
                          case 1:
                            return Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.redAccent,
                            );
                          case 2:
                            return Icon(
                              Icons.sentiment_neutral,
                              color: Colors.amber,
                            );
                          case 3:
                            return Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.lightGreen,
                            );
                          case 4:
                            return Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            );
                        }
                        return Container();
                      },
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: Text("No"),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          // Navigator.pop(context);
                        },
                        child: Text("Yes"))
                  ],
                );
              },
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
        key: gkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.23,
              ),
              Center(
                child: Text(
                  "Login",
                  style: GoogleFonts.alike(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "please Enter your Login and  Your password",
                  style: GoogleFonts.alike(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 17),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: TextFormField(
                  controller: idcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "*Enter User Email-id";
                    } else if(value?.contains("@")??false){
                      return null;
                    }else{
                       return "invalied Email-id";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your Email id",
                    label: Text("Enter your Email id"),
                    filled: true,
                    focusColor: Colors.black12,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: TextFormField(
                  controller: passwordcontroller,
                  validator: (value) {
                    // var intvalue=int.tryParse(value!);
                    if (value?.isEmpty ?? true) {
                      return "*enter your password";
                    } else if (value?.contains("#") ?? true) {
                      return null;
                    } else {
                      return "invalied Password";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your Password",
                    label: Text("Enter your Password"),
                    filled: true,
                    focusColor: Colors.black12,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    icon: Icon(
                      Icons.key,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        bool isvalied = gkey.currentState?.validate() ?? true;
                        if (isvalied) {
                          gkey.currentState?.save();
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login Successfully"),
                            ),
                          );
                          Navigator.pushNamed(context, "Homepage");
                        }
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.alike(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      )),
                  SizedBox(width: 10,),
                  OutlinedButton(
                      onPressed: () {
                        bool isvalied = gkey.currentState?.validate() ?? true;
                        if (isvalied) {
                          gkey.currentState?.reset();
                       idcontroller.clear();
                       passwordcontroller.clear();
                        }
                      },
                      child: Text(
                        "Reset",
                        style: GoogleFonts.alike(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      )),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
