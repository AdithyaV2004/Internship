import 'package:flutter/material.dart';
import 'package:flutter_application_user_management_2/Core/core.dart';

class ScreenUserHome extends StatelessWidget {
  ScreenUserHome({super.key});
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
        title: Text('Welcome<Name>', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              isEditableNotifier.value = true;
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
                    enabled: newIsEditable,
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
                    items:
                        userGender.map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                    hint: Text('Gender'),

                    value: selectedGender,
                    onChanged:
                        newIsEditable == true
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
                    onPressed:
                        newIsEditable == true
                            ? () {
                              if (_regFormKey.currentState!.validate()) {}
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
