import 'package:firebase_app/Core/core.dart';
import 'package:firebase_app/Infrastructure/db_functions.dart';
import 'package:firebase_app/Model/user_model.dart';
import 'package:flutter/material.dart';

class ScreenUserHome extends StatelessWidget {
  bool editKey = false;
  UserModel u;
  ScreenUserHome({super.key, required this.u}) {
    appBarTitle = u.userName;
    userNameController.text = u.userName;
    userEmailController.text = u.userEmail;
    selectedGender = u.userGender;
    userAddressController.text = u.userAddress;
  }
  String appBarTitle = '';
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userPasswordReconfirmController = TextEditingController();
  final userAddressController = TextEditingController();
  List<String> userGender = ['Male', 'Female', 'Other'];
  final _regFormKey = GlobalKey<FormState>();
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Welcome $appBarTitle',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              editKey = !editKey;
              isEditableNotifier.value = editKey;
            },
            icon: Icon(Icons.edit, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Form(
        key: _regFormKey,
        child: ValueListenableBuilder(
          valueListenable: isEditableNotifier,
          builder: (context, bool newIsEditable, _) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    enabled: newIsEditable,
                    controller: userNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    enabled: false,
                    controller: userEmailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Gender Required';
                      }
                      return null;
                    },
                    items: userGender.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    hint: Text('Gender'),

                    value: selectedGender,
                    onChanged: newIsEditable == true
                        ? (newGender) {
                            selectedGender = newGender as String?;
                          }
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    enabled: newIsEditable,

                    controller: userAddressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Address required';
                      }
                      return null;
                    },
                    maxLines: 5,

                    decoration: InputDecoration(
                      hintText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: newIsEditable == true
                        ? () async {
                            if (_regFormKey.currentState!.validate()) {
                              UserModel u = UserModel(
                                "id",
                                userNameController.text,
                                userEmailController.text,
                                selectedGender!,
                                userAddressController.text,
                                "",
                              );
                              bool result = await editUser(u);
                              if (result) {
                                final snackBar = SnackBar(
                                  content: Text("Data Changed"),
                                );
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(snackBar);
                              } else {
                                final snackBar = SnackBar(
                                  content: Text("Couldn't update data"),
                                );
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(snackBar);
                              }
                            }
                          }
                        : null,
                    child: Text('Save Changes'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
