import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GalleryScreen extends StatefulWidget {
  final String newImageUrl;

  const GalleryScreen({super.key, this.newImageUrl = ''});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<String> _images = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: Colors.cyan,
      ),
      body: _isLoading
          ? const Center(
        child: SpinKitFadingCircle(
          color: Colors.blueAccent,
          size: 50.0,
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: (_images.length + 1) ~/ 2,
          itemBuilder: (context, index) {
            final int firstIndex = index * 2;
            final int secondIndex = firstIndex + 1;
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Image.network(
                        _images[firstIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                if (secondIndex < _images.length)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Image.network(
                          _images[secondIndex],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddImageDialog(context);
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> _fetchImages() async {
    for (int i = 0; i < 5; i++) {
      int imageId = Random().nextInt(1000); // Generate image IDs between 0 to 1000
      final response = await http.get(Uri.parse('https://picsum.photos/id/$imageId/info'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _images.add(data['download_url']);
        });
      }
    }

    if (widget.newImageUrl.isNotEmpty) {
      setState(() {
        _images.add(widget.newImageUrl);
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _showAddImageDialog(BuildContext context) {
    TextEditingController urlController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Image'),
          content: TextField(
            controller: urlController,
            decoration: const InputDecoration(hintText: "Enter image ID (0-1000)"),
            keyboardType: TextInputType.number,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                setState(() {
                  _images.add('https://picsum.photos/id/${urlController.text}/200/300');
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
