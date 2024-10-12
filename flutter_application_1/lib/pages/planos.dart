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
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Escolha um dos planos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildPlanCard(true)),
                const SizedBox(width: 16),
                Expanded(child: _buildPlanCard(false)),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'De onde você quer trazer seus dados financeiros?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Procurar banco',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Add finalization logic here
              },
              child: const Text('Finalizar cadastro'),
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isPremium ? 'Premium' : 'Padrão',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              isPremium ? 'R\$ 10,00 / Mês' : 'R\$ 5,00',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildFeature('Lorem ipsum'),
            _buildFeature('Dolor sit'),
            _buildFeature(isPremium ? 'Adipiscing elit' : 'Adipiscin'),
            const SizedBox(height: 10),
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
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check, size: 16),
          const SizedBox(width: 4),
          Text(text),
        ],
      ),
    );
  }
}
