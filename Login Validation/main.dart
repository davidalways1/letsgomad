
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 15,
                  bottom: 0,
                ),
                child: TextFormField(
  controller: _passwordController,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else if (!RegExp(r'(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&*!])[A-Za-z\d@#$%^&*!]{6,}').hasMatch(value)) {
      return 'Password must contain at least one uppercase, one lowercase, one digit, and one special character';
    }
    return null;
  },
  obscureText: true,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Password',
    hintText: 'Enter secure password',
  ),
),
              ),
              TextButton(
                onPressed: () {
                  // TODO: FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
  height: 50,
  width: 250,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(20),
  ),
  child: TextButton(
    onPressed: () {
      // Check if both email and password are empty
      if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
        print('Password unsuccessful');
        return;
      }

      // Continue with the validation logic
      if (_formKey.currentState?.validate() ?? false) {
        // Validation successful, navigate to the home page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InformationPage(),
          ),
        );
      }
    },
    child: Text(
      'Login',
      style: TextStyle(color: Colors.white, fontSize: 25),
    ),
  ),
),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to registration screen
                },
                child: Text(
                  'New User? Create Account',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}
class _InformationPageState extends State<InformationPage> {
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedBranch = 'IT';
  String _selectedGender = 'Male'; // Set to 'Male' initially

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _rollNoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Roll No';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Roll No',
                  hintText: 'Enter your Roll No',
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter your Name',
                ),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField(
                value: _selectedBranch,
                items: ['IT', 'CS', 'AIDS', 'EXTC', 'Chemical']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBranch = value.toString();
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Branch',
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text('Gender:'),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Radio(
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                      Text('Male'),
                      SizedBox(width: 10),
                      Radio(
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Clear button logic
                      _rollNoController.clear();
                      _nameController.clear();
                      setState(() {
                        _selectedBranch = 'IT';
                        _selectedGender = 'Male';
                      });
                    },
                    child: Text('Clear'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Validation successful, perform submit logic
                        // You can add logic here to handle the submitted data
                        // For now, just print the entered information
                        print('Roll No: ${_rollNoController.text}');
                        print('Name: ${_nameController.text}');
                        print('Branch: $_selectedBranch');
                        print('Gender: $_selectedGender');
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}