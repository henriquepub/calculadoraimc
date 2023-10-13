import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);

  double calcularIMC() {
    if (altura <= 0) {
      throw ArgumentError('Altura deve ser maior que 0');
    }
    return peso / (altura * altura);
  }
}

void main() {
  try {
    print('Calculadora de IMC');
    print('Digite seu nome:');
    final nome = stdin.readLineSync() ?? '';
    print('Digite seu peso (em kg):');
    final pesoString = stdin.readLineSync() ?? '';
    final peso = double.tryParse(pesoString) ?? 0.0;
    print('Digite sua altura (em metros):');
    final alturaString = stdin.readLineSync() ?? '';
    final altura = double.tryParse(alturaString) ?? 0.0;

    final pessoa = Pessoa(nome, peso, altura);
    final imc = pessoa.calcularIMC();

    print('Resultado do IMC para ${pessoa.nome}: $imc');
  } catch (e) {
    print('Erro: $e');
  }
}
