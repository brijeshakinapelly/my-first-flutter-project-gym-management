import 'package:flutter/material.dart';
import 'package:gym_management/gridcardpages/memberslist.dart';
import 'dart:core';
import 'package:intl/intl.dart';

class AddMembers extends StatefulWidget {
  const AddMembers({Key? key}) : super(key: key);

  @override
  State<AddMembers> createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  @override
  Widget build(BuildContext context) {
    List<String> items = ['Weight loss', 'Weight gain', 'Muscle'];
    String? dropdownValue = 'Weight loss';
    var _formKey = GlobalKey<FormState>();
    String _selectedGender = 'male';
    TextEditingController _date = TextEditingController();
    TextEditingController _dateone = TextEditingController();

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add member'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 21),
            child: TextButton(
                onPressed: () {
                  final isValidForm = _formKey.currentState!.validate();
                  if (isValidForm) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const MembersList(),
                      ),
                    );
                  }
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/ampersonicon.png',
                    height: 120,
                  ),
                ),
                // OutlinedButton.icon(
                //   onPressed: () {},
                //   icon: Icon(Icons.camera),
                //   label: Text('ADD PHOTO'),
                // ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Member name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Member name',
                  ),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a Member name';
                    }
                    return null;
                  },
                ),
                // SizedBox(
                //   height: 15,
                // ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     hintText: 'Member id',
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20)),
                //     labelText: 'Member id',
                //   ),
                //   keyboardType: TextInputType.number,
                //   onFieldSubmitted: (value) {},
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Enter a Member id';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Mobile Number',
                  ),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a Mobile Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Email Address',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                StatefulBuilder(builder: (context, setState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Text(
                          'Gender :-',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'male',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('Male'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'female',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('Female'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'other',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('Other'),
                      ),
                    ],
                  );
                }),
                SizedBox(
                  height: 17,
                ),
                              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Package :-',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                      value: dropdownValue,
                      items:
                          items.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                        dropdownValue = newValue!;
                      }),
                ],
              ),
                SizedBox(
                  height: 17,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Add more details here',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Add more details here',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
