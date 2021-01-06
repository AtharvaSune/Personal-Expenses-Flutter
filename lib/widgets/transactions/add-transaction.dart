import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final clickHandler;

  AddTransaction(this.clickHandler);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _onPressed() {
    if (amountController.text.isEmpty) return;

    String text = titleController.text;
    double amt = double.tryParse(amountController.text) ?? 0.0;

    if (text.isEmpty || amt == 0.0) {
      return;
    }

    clickHandler(text, amt);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => _onPressed(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              onSubmitted: (_) => _onPressed(),
            ),
            FlatButton(
              onPressed: _onPressed,
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
