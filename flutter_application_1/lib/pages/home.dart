import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: const Text('Go to Second Page'),
        ),
      ),
      bottomNavigationBar:
        BottomNavigationBar(
          onTap: (index) { setState(() {myIndex = index;});}, 
          currentIndex: myIndex, 
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.payments), label: 'Gastos'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Dados'),
      ]),
    );
  }
}
