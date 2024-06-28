import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedbackForm extends StatefulWidget {
  final String lawyerId;

  FeedbackForm({Key? key, required this.lawyerId}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();

  @override
  Future<void> submitFeedback() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse('https://a181-2407-aa80-116-419e-21fd-f168-f137-55cf.ngrok-free.app/comment/add');
      try {
        final response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'lawyer_id': int.parse(widget.lawyerId),
            'comment': _commentController.text,
          }),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Feedback submitted successfully!'), backgroundColor: Colors.green)
          );
          Navigator.pop(context);
        } else {
          throw Exception('Failed to submit feedback: ${response.body}');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error submitting feedback: $e'), backgroundColor: Colors.red)
        );
        print('Error submitting feedback: $e');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit Feedback"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text('Submitting feedback for Lawyer ID: ${widget.lawyerId}'), // Display the lawyerId for reference
              TextFormField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Your Comment',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitFeedback,
                child: Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
