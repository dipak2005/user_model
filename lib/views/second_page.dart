import 'package:flutter/material.dart';
import 'package:flutter_exam/views/favourite.dart';
import 'package:flutter_exam/views/homepage.dart';

import 'package:flutter_exam/views/util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class Secondpage extends StatefulWidget {
  Map? data;

  Secondpage({Key? key, this.data}) : super(key: key);

  @override
  State<Secondpage> createState() => _SecondpageState();
}

bool isclick = false;
bool iscolor = false;

class _SecondpageState extends State<Secondpage> {
  void deleteuser(int index) {
    setState(() {
      Userlist.removeAt(index);
    });
  }

  void Favourite() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List of users",
          style: GoogleFonts.alike(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Share.share(User.fname??"");
            },
            icon: Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              isclick = !isclick;
              setState(() {});
            },
            icon:
                isclick ? Icon(Icons.grid_view) : Icon(Icons.list_alt_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 38),
            child: TextField(
              // controller: namecontroller,
              decoration: InputDecoration(
                filled: true,
                icon: Icon(
                  Icons.search,
                ),
                hintText: "search users",
              ),
              enabled: true,
            ),
          ),
          Expanded(
            child: isclick
                ? Stack(
                    children: [
                      ListView.builder(
                        itemCount: Userlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          User ul = Userlist[index];
                          return Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.9, 0.9),
                                        blurRadius: 10),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Name:"),
                                        Text(ul.fname),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("address:"),
                                        Text(ul.address),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("phone:"),
                                        Text(ul.phone),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Gender:"),
                                        Text(ul.gender),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("city:"),
                                        Text(ul.city),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 1.2,
                                right: 1.1,
                                child: IconButton(
                                    onPressed: () {
                                      deleteuser(index);
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.delete)),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  onPressed: () {
                                    iscolor = !iscolor;
                                    setState(() {});
                                  },
                                  icon: iscolor
                                      ? Icon(Icons.favorite)
                                      : Icon(Icons.favorite_border),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  )
                : GridView.builder(
                    itemCount: Userlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      print(Userlist[index]);
                      User ul = Userlist[index];

                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.9, 0.9),
                                    blurRadius: 10),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Name:"),
                                    Text(ul.fname),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("address:"),
                                    Text(ul.address),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("phone:"),
                                    Text(ul.phone),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Gender:"),
                                    Text(ul.gender),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("city:"),
                                    Text(ul.city),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Positioned(
                                      child: IconButton(
                                        onPressed: () {
                                          deleteuser(index);
                                        },
                                        icon: Icon(Icons.delete),
                                      ),
                                    ),
                                    Positioned(
                                      child: IconButton(
                                        onPressed: () {
                                          iscolor = !iscolor;
                                          setState(() {});
                                          Favlist.add(Userlist[index]);
                                        },
                                        icon: iscolor
                                            ? Icon(Icons.favorite)
                                            : Icon(Icons.favorite_border),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "Favourite");
          },
          child: Icon(Icons.favorite)),
    );
  }
}
