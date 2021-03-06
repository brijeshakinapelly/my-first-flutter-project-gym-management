import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_management/FutureDark.dart';
import 'package:gym_management/main.dart';
import 'package:gym_management/Model/model.dart';
import 'package:gym_management/pages/loginscreen.dart';
import 'package:gym_management/DatabaseHandler/databasehelper.dart';
import 'package:gym_management/Model/model.dart';
import 'package:sqflite/sqflite.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<User> usersList = [];
  var _formKey = GlobalKey<FormState>();
  final _conGymName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conphone = TextEditingController();
  final _conPassword = TextEditingController();

  // Future<void> insertMember(Member member) async{
  //   final db =  await database;
  //   return
  // }
  void addGymName(String gymname, email, password, number) {
    final user = User(
      gymname: gymname,
      email: email,
      password: password,
      number: number,
    );
    setState(() {
      usersList.add(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/signup.jpg',
                          ),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Positioned(
                          left: 30.0,
                          bottom: 20.0,
                          child: Text(
                            'Register',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 42.0,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[700]!.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          controller: _conGymName,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white70),
                            hintText: 'Gym name',
                            suffixIcon: Icon(
                              Icons.house_siding,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[700]!.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          controller: _conEmail,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white70),
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            //Validator
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[700]!.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          controller: _conphone,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white70),
                            hintText: 'Phone Number',
                            suffixIcon: Icon(
                              Icons.phone_sharp,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[700]!.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          controller: _conPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white70),
                              suffixIcon: Icon(
                                Icons.visibility_off,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
                                    .hasMatch(value)) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      GestureDetector(
                        onTap: () {
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const NavigationWidget(usersList: []),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 50.0,
                          width: 250.0,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Color(0xff141314),
                                  Color(0xFF3b3841)
                                ],
                              ),
                              borderRadius: BorderRadius.circular(50.0)),
                          child: const Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      GestureDetector(
                        onTap: () {
                          addGymName(_conGymName.text, _conEmail.text,
                              _conphone.text, _conPassword.text);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => NavigationWidget()));
                        },
                        child: Text.rich(TextSpan(
                            text: 'Already have an account',
                            children: [
                              TextSpan(
                                  text: ' Login',
                                  style: TextStyle(color: Color(0xffEE7B23)))
                            ])),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                    ],
                  ),
                ),
                // NavigationWidget(usersList: usersList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({
    Key? key,
    required this.usersList,
  }) : super(key: key);

  final List<User> usersList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 150,
        width: 350,
        child: Column(
          children: usersList.map((e) {
            return Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FutureDark(
                          gymname: e.gymname,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Navigate',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
