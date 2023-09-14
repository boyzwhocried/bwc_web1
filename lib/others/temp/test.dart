import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class PostmanTest extends StatefulWidget {
  const PostmanTest({super.key});

  @override
  PostmanTestState createState() => PostmanTestState();
}

class PostmanTestState extends State<PostmanTest> {
  String apiUrl = "";
  String responseText = "";

  // Function to make an HTTP request
  Future<void> makeRequest() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        setState(() {
          responseText = response.body;
        });
      } else {
        setState(() {
          responseText = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        responseText = 'Error: $e';
      });
    }
  }

  // Function to import Postman collection JSON file
  Future<void> importCollection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null) {
      final String? filePath = result.files.single.path;
      final jsonString = await File(filePath!).readAsString();
      final jsonData = json.decode(jsonString);

      // Extract the API URL
      final firstRequest = jsonData['item'][0]['request'];
      final apiUrl = firstRequest['url']['raw'];

      setState(() {
        this.apiUrl = apiUrl;
        responseText = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Postman-like Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            onPressed: importCollection,
            child: const Text('Import Collection'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('API URL: $apiUrl'),
          ),
          ElevatedButton(
            onPressed: makeRequest,
            child: const Text('Send Request'),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(responseText),
            ),
          ),
        ],
      ),
    );
  }
}
