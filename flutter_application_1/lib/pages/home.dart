import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Principais cartões',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _buildCardInfo('Crédito', 'R\$ 130,21', Colors.purple)),
                  SizedBox(width: 10),
                  Expanded(child: _buildCardInfo('Débito', 'R\$ 70,3!', Colors.orange)),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Pagamentos do mês',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildPaymentsList(),
              const SizedBox(height: 20),
              _buildTotalExpenses(),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
        BottomNavigationBar(
          onTap: (index) { setState(() {myIndex = index;});}, 
          currentIndex: myIndex, 
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Gastos'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Dados'),
      ]),
    );
  }

  Widget _buildCardInfo(String title, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const  TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(amount, style:const  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPaymentsList() {
    final payments = [
      {'name': 'Netflix', 'cost': 'R\$ 40,99', 'category': 'Streaming'},
      {'name': 'Amazon', 'cost': 'R\$ 19,99', 'category': 'Streaming'},
      {'name': 'Adobe', 'cost': 'R\$ 31,99', 'category': 'Trabalho'},
      {'name': 'Google', 'cost': 'R\$ 75,15', 'category': 'Trabalho'},
      {'name': 'Spotify', 'cost': 'R\$ 21,90', 'category': 'Streaming'},
    ];

    return Container(
      padding: const EdgeInsets.all(8), // Add some padding inside the box
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the box
        borderRadius: BorderRadius.circular(8), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25), // Shadow color with opacity
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 2.5, // Softness of the shadow
            offset: const Offset(3, 3), // Position of the shadow (x, y)
          ),
        ],
      ),
      child: Column(
        children: payments.map((payment) => _buildPaymentItem(payment)).toList(),
      ),
    );
  }

  Widget _buildPaymentItem(Map<String, String> payment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(payment['name']!),
          Text(payment['cost']!),
          Text(
            payment['category']!,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalExpenses() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25), // Shadow color with opacity
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 2.5, // Softness of the shadow
            offset: const Offset(3, 3), // Position of the shadow (x, y)
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.attach_money),
              SizedBox(width: 8), // Add space between the icon and the text
              Text( 'TOTAL DOS GASTOS', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text( 'R\$ 240,82', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}