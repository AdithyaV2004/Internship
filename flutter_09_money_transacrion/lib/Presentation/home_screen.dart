// ignore_for_file: file_names, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_09_money_transacrion/Presentation/model.dart';

class ScreenHome extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<List<moneyModel>> myListNotifier = ValueNotifier([
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
  ]);

  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ValueListenableBuilder<List<moneyModel>>(
        valueListenable: myListNotifier,
        builder: (context, myList, _) => ListView.separated(
          itemCount: myList.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) =>
              _buildListTile(context, index, myList[index]),
        ),
      ),
      floatingActionButton: _buildFAB(context),
    );
  }

  AppBar _buildAppBar() => AppBar(
    leading: IconButton(
      onPressed: SystemNavigator.pop,
      icon: const Icon(
        Icons.arrow_back,
        color: Color.fromARGB(255, 234, 255, 0),
      ),
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
  );

  Widget _buildListTile(BuildContext context, int index, moneyModel model) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 2, 131, 19),
        child: Text(
          '${index + 1}',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              model.transactionNarration,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () => _editTransaction(context, index),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Color.fromARGB(255, 255, 17, 0),
            ),
            onPressed: () => _showDeleteDialog(context, index),
          ),
        ],
      ),
      subtitle: Text(
        "Amount: ₹${model.transactionAmount}",
        style: TextStyle(
          fontSize: 15,
          color: model.transactionType == '-1' ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFAB(BuildContext context) => FloatingActionButton(
    backgroundColor: Colors.blue,
    child: const Icon(Icons.add, color: Colors.white),
    onPressed: () => _showAddTransactionDialog(context),
  );

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          "Are you sure about this?",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "No",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: () {
              myListNotifier.value = List.from(myListNotifier.value)
                ..removeAt(index);
              Navigator.pop(context);
            },
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddTransactionDialog(BuildContext context) {
    final narrationController = TextEditingController();
    final amountController = TextEditingController();
    String? selectedType;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          "Add Transaction",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(narrationController, "Narration"),
              const SizedBox(height: 10),
              _buildTextField(amountController, "Amount", isNumber: true),
              DropdownButtonFormField<String>(
                value: selectedType,
                items: const [
                  DropdownMenuItem(value: '+1', child: Text('Income')),
                  DropdownMenuItem(value: '-1', child: Text('Expense')),
                ],
                onChanged: (value) => selectedType = value,
                decoration: const InputDecoration(
                  labelText: "Transaction Type",
                ),
                validator: (value) =>
                    value == null ? 'Please select a transaction type' : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                myListNotifier.value.add(
                  moneyModel(
                    id: DateTime.now().toString(),
                    transactionNarration: narrationController.text,
                    transactionAmount: amountController.text,
                    transactionType: selectedType!,
                  ),
                );
                myListNotifier.notifyListeners();
                Navigator.pop(context);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void _editTransaction(BuildContext context, int index) {
    final narrationController = TextEditingController(
      text: myListNotifier.value[index].transactionNarration,
    );
    final amountController = TextEditingController(
      text: myListNotifier.value[index].transactionAmount,
    );
    String selectedType = myListNotifier.value[index].transactionType;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          "Edit Transaction",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: narrationController,
              decoration: const InputDecoration(labelText: "Narration"),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
            ),
            DropdownButtonFormField<String>(
              value: selectedType,
              items: const [
                DropdownMenuItem(value: '+1', child: Text('Income')),
                DropdownMenuItem(value: '-1', child: Text('Expense')),
              ],
              onChanged: (value) => selectedType = value!,
              decoration: const InputDecoration(labelText: "Transaction Type"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              final updated = moneyModel(
                id: myListNotifier.value[index].id,
                transactionNarration: narrationController.text,
                transactionAmount: amountController.text,
                transactionType: selectedType,
              );
              final list = List<moneyModel>.from(myListNotifier.value);
              list[index] = updated;
              myListNotifier.value = list;
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    bool isNumber = false,
  }) => TextFormField(
    controller: controller,
    keyboardType: isNumber ? TextInputType.number : TextInputType.text,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      hintText: hint,
    ),
    validator: (value) =>
        (value == null || value.isEmpty) ? 'Please enter $hint' : null,
  );
}
