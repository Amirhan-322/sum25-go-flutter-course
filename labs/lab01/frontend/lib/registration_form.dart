import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool submited;

  @override
  void initState() {
    submited = false;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // TODO: Implement form submission
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    setState(() {
      submited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  key: const Key('name'),
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
            
                TextFormField(
                  key: const Key('email'),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty || (!value.contains('@')) || (value.split('@').length != 2) 
                      || value.split('@')[1].length < 3 || !value.split('@')[1].contains('.')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
            
                TextFormField(
                  key: const Key('password'),
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
            
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      
                      if (_formKey.currentState!.validate()) {
                        _submitForm();
                      }else{
                        setState(() {
                          submited = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Submit'),
                  ),
                ),

                submited ? const Text("Registration successful!") : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
