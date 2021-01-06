import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final clickHandler;

  AddTransaction(this.clickHandler);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _onPressed() {
    if (amountController.text.isEmpty) return;

    String text = titleController.text;
    double amt = double.tryParse(amountController.text) ?? 0.0;

    if (text.isEmpty || amt == 0.0) {
      return;
    }

    widget.clickHandler(text, amt);

    Navigator.of(context).pop();
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
              textCapitalization: TextCapitalization.sentences,
              controller: titleController,
              onSubmitted: (_) => _onPressed(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _onPressed(),
            ),
            FlatButton(
              onPressed: _onPressed,
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
