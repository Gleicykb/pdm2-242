import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeProjeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeProjeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  // 1. Criar vários objetos Dependentes
  var dependente1 = Dependente("CarlosG");
  var dependente2 = Dependente("Ana");
  var dependente3 = Dependente("Pedro");

  // 2. Criar vários objetos Funcionário 
  // 3. Associar os Dependentes criados
  var funcionario1 = Funcionario("João", [dependente1, dependente2]);
  var funcionario2 = Funcionario("Maria", [dependente3]);

  // 3. Criar uma lista de Funcionários
  List<Funcionario> funcionarios = [funcionario1, funcionario2];

  // 4. Criar um objeto EquipeProjeto
  var equipe = EquipeProjeto("Programação de Dispositivos Móveis II", funcionarios);

  // 5. Printar no formato JSON o objeto EquipeProjeto
  String equipeJson = jsonEncode(equipe.toJson());
  print(equipeJson);
}
