import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:gym_management/gridcardpages/addmembers.dart';
import 'package:gym_management/gridcardpages/addtrainer.dart';
import 'package:gym_management/gridcardpages/enquiry.dart';
import 'package:gym_management/gridcardpages/enquirylist.dart';
import 'package:gym_management/gridcardpages/memberslist.dart';
import 'package:gym_management/gridcardpages/packages.dart';
import 'package:gym_management/gridcardpages/payments.dart';
import 'package:gym_management/gridcardpages/trainerlist.dart';
import 'package:gym_management/pages/account.dart';
import 'package:gym_management/pages/homebottomNavigationbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home',style: GoogleFonts.roboto(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold)),
          //    actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Platform.isAndroid ? Icons.more_vert : Icons.more_horiz),
          //   ),
          // ],
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(''),
              ),
              ListTile(
                leading: Icon(
                  Icons.share,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  'Share',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.contact_mail,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  'Contact us',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.view_list,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  'Terms & Conditons',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.person_search_sharp,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  'Log out',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddMembers()));
                    },
                    child: Card(
                      child: Container(
                        height: 140,
                        child: Row(
                          children: [
                            Expanded(flex: 1,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset(
                                    'assets/images/addmembericon44.png',height: 50,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 3,
                                child: Container(
                              padding: EdgeInsets.only(left: 24),
                              child: ListTile(
                                title: Text('Add member',
                                    style: GoogleFonts.roboto(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MembersList()));
                    },
                    child: Card(
                      child: Container(
                        height: 140,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset(
                                    'assets/images/membersicon44.png',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                                child: Container(
                              padding: EdgeInsets.only(left: 24),
                              child: ListTile(
                                title: Text('Members',
                                    style: GoogleFonts.roboto(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Packages()));
                    },
                    child: Card(
                      child: Container(
                        height: 140,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset(
                                    'assets/images/packageicon44.png',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                                child: Container(
                              padding: EdgeInsets.only(left: 24),
                              child: ListTile(
                                title: Text('Package',
                                    style: GoogleFonts.roboto(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ));
  }
}
