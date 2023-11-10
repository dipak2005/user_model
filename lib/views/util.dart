import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

List<User> Userlist = [];
List<User> Favlist = [];
List<User> Filterlist=[];
class User {
  String fname;
  String address;
  String phone;
  String gender;
  String city;

  User(
      {required this.fname,
      required this.city,
      required this.gender,
      required this.phone,
      required this.address});
}

List<Map<String, dynamic>> citylist = [
  {"name": "rajkot"},
  {"name": "surat"},
  {"name": "amreli"},
  {"name": "ahmedabad"},
  {"name": "vadodra"},
  {"name": "jamnagar"},
  {"name": "junagadh"},
  {"name": "somnath"},
  {"name": "mehsana"},
];

List<TextStyle> fontlist = [
  GoogleFonts.alike(),
  GoogleFonts.agdasima(),
  GoogleFonts.alice(),
  GoogleFonts.alata(),
  GoogleFonts.acme(),
  GoogleFonts.almarai(),
  GoogleFonts.allison(),
  GoogleFonts.akatab(),
  GoogleFonts.aBeeZee(),
  GoogleFonts.abel(),
  GoogleFonts.abhayaLibre(),
];
