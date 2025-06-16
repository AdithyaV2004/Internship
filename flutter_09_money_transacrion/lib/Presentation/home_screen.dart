// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_09_money_transacrion/Presentation/model.dart';

class ScreenHome extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final ValueNotifier<List<moneyModel>> myListNotifier =
      ValueNotifier<List<moneyModel>>([
        moneyModel(
          id: '1',
          transactionNarration: 'Grocery',
          transactionType: '-1',
          transactionAmount: '2000',
        ),
        moneyModel(
          id: '2',
          transactionNarration: 'Salary',
          transactionType: '+1',
          transactionAmount: '50000',
        ),
        // Add other initial items here...
      ]);

  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 234, 255, 0),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 131, 19),
        title: const Text(
          "Money Tracker",
          style: TextStyle(
            color: Color.fromARGB(255, 251, 255, 0),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ValueListenableBuilder<List<moneyModel>>(
        valueListenable: myListNotifier,
        builder: (context, myList, _) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 2, 131, 19),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    (index + 1).toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      myList[index].transactionNarration,
                      style: const TextStyle(fontSize: 25),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        // Edit logic here (if any)
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                "Are you sure about this?",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    myListNotifier.value = List.from(myList)
                                      ..removeAt(
                                        index,
                                      ); // Notify listeners about the change
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 255, 17, 0),
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  "Amount: ₹${myList[index].transactionAmount}",
                  style: const TextStyle(fontSize: 15),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: myList.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String? selectedType;
              final narrationController = TextEditingController();
              final amountController = TextEditingController();

              return AlertDialog(
                title: const Text(
                  "Add Transaction",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: narrationController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Narration",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter narration';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Amount",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter amount';
                          }
                          return null;
                        },
                      ),
                      DropdownButtonFormField<String>(
                        value: selectedType,
                        items: const [
                          DropdownMenuItem(value: '+1', child: Text('Income')),
                          DropdownMenuItem(value: '-1', child: Text('Expense')),
                        ],
                        onChanged: (value) {
                          selectedType = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Transaction Type",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a transaction type';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        myListNotifier.value.add(
                          moneyModel(
                            id: DateTime.now().toString(),
                            transactionNarration: narrationController.text,
                            transactionAmount: amountController.text,
                            transactionType: selectedType!,
                          ),
                        );
                        myListNotifier
                            .notifyListeners(); // Notify listeners about the new item
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
