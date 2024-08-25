import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
import 'quote_add_form.dart';

void main() {
  runApp(const MaterialApp(home: QuotesApp()));
}

class QuotesApp extends StatefulWidget {
  const QuotesApp({super.key});

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  List<Quote> quotes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes App"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: quotes.map((quote) => SizedBox(
              height: 150,
              child: QuoteWidget(
                  quote: quote,
                  onDelete: () {
                    setState(() {
                      quotes.remove(quote);
                    });
                  }
              )
          )).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddQuoteDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddQuoteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return QuoteAddForm(
          addCallback: (String content, String author) {
            setState(() {
              quotes.add(Quote(content: content, author: author));
            });
          },
          cancelCallback: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
