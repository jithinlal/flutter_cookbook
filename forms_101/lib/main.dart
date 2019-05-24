import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 1. A custom form with validation
// 2. Focus Node form text field
// 3. Retrieve the data from a text field
void main() => runApp(RetrieveDataForm());

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Validation'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Builder(
                  builder: (context2) => RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Scaffold.of(context2).showSnackBar(
                              SnackBar(
                                content: Text('Processing Data'),
                              ),
                            );
                          }
                        },
                        child: Text('Submit'),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FocusTextFormField extends StatefulWidget {
  @override
  _FocusTextFormFieldState createState() => _FocusTextFormFieldState();
}

class _FocusTextFormFieldState extends State<FocusTextFormField> {
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Text Focus Node',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Focus Node'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
              ),
              TextField(
                focusNode: myFocusNode,
              ),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context2) => FloatingActionButton(
                onPressed: () =>
                    FocusScope.of(context2).requestFocus(myFocusNode),
                child: Icon(Icons.edit),
              ),
        ),
      ),
    );
  }
}

class RetrieveDataForm extends StatefulWidget {
  @override
  _RetrieveDataFormState createState() => _RetrieveDataFormState();
}

class _RetrieveDataFormState extends State<RetrieveDataForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrive Data',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Retrieve Data'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: myController,
          ),
        ),
        floatingActionButton: Builder(
          builder: (context2) => FloatingActionButton(
                onPressed: () {
                  return showDialog(
                      context: context2,
                      builder: (context3) {
                        return AlertDialog(
                          content: Text(myController.text),
                        );
                      });
                },
                tooltip: 'Show me the value!',
                child: Icon(Icons.text_fields),
              ),
        ),
      ),
    );
  }
}
