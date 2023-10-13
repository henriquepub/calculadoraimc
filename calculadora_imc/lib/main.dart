import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CalculadoraIMC(),
  ));
}

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});

  @override
  
  // ignore: library_private_types_in_public_api
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resultado = '';

  void calcularIMC() {
    double peso = double.tryParse(pesoController.text) ?? 0.0;
    double altura = double.tryParse(alturaController.text) ?? 0.0;

    if (peso == 0 || altura == 0) {
      setState(() {
        resultado = 'Preencha peso e altura corretamente.';
      });
    } else {
      double imc = peso / (altura * altura);
      setState(() {
        resultado = 'Seu IMC é: ${imc.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Altura (m)'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calcularIMC,
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 16.0),
            Text(resultado, style: const TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
