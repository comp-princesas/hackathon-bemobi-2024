import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool _agreedToTerms = false;

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
            _buildInputField('Nome', 'Digite seu nome completo', Icons.person),
            const SizedBox(height: 16),
            _buildInputField('Email', 'Digite seu email', Icons.email),
            const SizedBox(height: 16),
            _buildInputField('Senha', 'Digite sua senha', Icons.lock, isPassword: true),
            const SizedBox(height: 16),
            _buildInputField('Celular', '(xx) xxxxx-xxxx', Icons.phone),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _agreedToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreedToTerms = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    'Concordo com os Termos de Uso do GemniA.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: _agreedToTerms
                  ? () {
                      // Add registration logic here
                    }
                  : null,
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, IconData icon, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: isPassword ? const Icon(Icons.visibility) : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
