import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  State<FormExample> createState()=> FormExampleState();
}

class FormExampleState extends State<FormExample>{

  final _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
  return Scaffold(
    body:
     Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'enter your name',border: OutlineInputBorder()),
              validator: (value) {
                if(value ==null || value.isEmpty){
                  return 'please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 25,),
            
            TextFormField(
            decoration: InputDecoration(
              labelText: 'enter your email',border: OutlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if(value ==null || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
    
                  return 'please enter a valid email';
                }
                return null;
              },
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')),);
              }
            }, child: Text('Submit'),
            ),
            ),
          
    
        ],
      ),
      ),
    
    ),
  );
  }
}