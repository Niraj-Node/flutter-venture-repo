import 'package:flutter/material.dart';

class QuoteAddForm extends StatefulWidget {
  const QuoteAddForm({
    super.key,
    required this.addCallback,
    required this.cancelCallback,
  });

  // Callback to be called when a quote is added
  final void Function(String text, String author) addCallback;

  // Callback to be called when the action is canceled
  final VoidCallback cancelCallback;

  @override
  State<QuoteAddForm> createState() => _QuoteAddFormState();
}

class _QuoteAddFormState extends State<QuoteAddForm> {
  final _formKey = GlobalKey<FormState>();

  String content = '';
  String author = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Quote"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Content"),
              validator: (contentText) {
                if ((contentText == null) || contentText.isEmpty) {
                  return "Enter content";
                }
                return null;
              },
              onSaved: (value) {
                content = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Author"),
              validator: (authorName) {
                if ((authorName == null) || authorName.isEmpty) {
                  return "Enter author";
                }
                return null;
              },
              onSaved: (value) {
                author = value!;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: widget.cancelCallback,
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.addCallback(content, author);
              Navigator.of(context).pop();
            }
          },
          child: const Text("Add"),
        ),
      ],
    );
  }
}