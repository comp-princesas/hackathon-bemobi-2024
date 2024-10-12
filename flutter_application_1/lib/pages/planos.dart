import 'package:flutter/material.dart';

class PlanSelectionPage extends StatelessWidget {
  const PlanSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Escolha um dos planos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildPlanCard(true)),
                SizedBox(width: 16),
                Expanded(child: _buildPlanCard(false)),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'De onde você quer trazer seus dados financeiros?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Procurar banco',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Add finalization logic here
              },
              child: Text('Finalizar cadastro'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(bool isPremium) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: isPremium ? Colors.blue : Colors.grey),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isPremium ? 'Premium' : 'Padrão',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              isPremium ? 'R\$ 10,00 / Mês' : 'R\$ 5,00',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            _buildFeature('Lorem ipsum'),
            _buildFeature('Dolor sit'),
            _buildFeature(isPremium ? 'Adipiscing elit' : 'Adipiscin'),
            SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: isPremium ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                // Add plan selection logic here
              },
              child: Text(isPremium ? 'Escolher plano' : 'Escolhe'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check, size: 16),
          SizedBox(width: 4),
          Text(text),
        ],
      ),
    );
  }
}
