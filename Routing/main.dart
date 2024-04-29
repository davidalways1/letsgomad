import 'package:flutter/material.dart';
import 'product.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/products': (context) => Product(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Cart App'),
        backgroundColor: const Color.fromARGB(255, 97, 170, 70),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Welcome to Online Cart App'),
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: const Color.fromARGB(255, 97, 170, 70),
        onPressed: () {
          Navigator.pushNamed(context, '/products');
        // Navigator.pushReplacementNamed(context, '/home', arguments: isAdmin);
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
