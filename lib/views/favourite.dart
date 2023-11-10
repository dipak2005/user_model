import 'package:flutter/material.dart';
import 'package:flutter_exam/views/second_page.dart';
import 'package:flutter_exam/views/util.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  void deletefavuser(int index) {
    setState(() {
      Favlist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite_users",
          style: GoogleFonts.alike(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
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
                        itemCount: Favlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          User fl = Favlist[index];
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
                                        Text(fl.fname),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("address:"),
                                        Text(fl.address),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("phone:"),
                                        Text(fl.phone),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Gender:"),
                                        Text(fl.gender),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("city:"),
                                        Text(fl.city),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                    onPressed: () {
                                      deletefavuser(index);
                                    },
                                    icon: Icon(Icons.delete)),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  )
                : GridView.builder(
                    itemCount: Favlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      print(Userlist[index]);
                      User fl = Favlist[index];

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
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Name:"),
                                    Text(fl.fname),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("address:"),
                                    Text(fl.address),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("phone:"),
                                    Text(fl.phone),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Gender:"),
                                    Text(fl.gender),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("city:"),
                                    Text(fl.city),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("Delete"),
                                              content: Text(
                                                "Are you want to sure delete this user",
                                                style: GoogleFonts.alike(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text("No"),
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      deletefavuser(index);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("yes"))
                                              ],
                                            );
                                          },
                                        );
                                      });
                                    },
                                    icon: Icon(Icons.delete))
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
    );
  }
}
