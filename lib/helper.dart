import 'perguntas.dart';

class Helper {
  int _numQuAtual = 0;
  int resp = 0;
  List<Perguntas> _bancoDePerguntas = [
    Perguntas(q: 'O metrô é um dos meios de transporte mais seguros do mundo.', r: true),
    Perguntas(q: 'A culinária brasileira é uma das melhores do mundo.', r: true),
    Perguntas(q: 'Vacas podem voar, assim como peixes utilizam os pés para andar.', r: false),
    Perguntas(q: 'A maioria dos peixes podem viver fora da água.', r: false),
    Perguntas(q: 'A lâmpada foi inventada por um brasileiro.', r: false),
    Perguntas(q: 'É possível utilizar a carteira de habilitação de carro para dirigir um avião.', r: false),
    Perguntas(q: 'O Brasil possui 26 estados e 1 Distrito Federal.', r: true),
    Perguntas(q: 'Bitcoin é o nome dado a uma das moedas virtuais mais famosas.', r: true),
    Perguntas(q: '1 minuto equivale a 60 segundos.', r: true),
    Perguntas(q: '1 segundo equivale a 200 milissegundos.', r: false),
    Perguntas(q: 'O Burj Khalifa, em Dubai, é considerado o maior prédio do mundo.', r: true),
    Perguntas(q: 'Ler após uma refeição prejudica a visão humana.', r: false),
    Perguntas(q: 'O cartão de crédito pode ser considerado uma moeda virtual.', r: false)
  ];

  void proximaPergunta() {
    if (_numQuAtual < _bancoDePerguntas.length -1) {
      _numQuAtual ++;
      print(_numQuAtual);
    }

  }
  String getBancoDePerguntas () {
    return _bancoDePerguntas[_numQuAtual].q;
  }

  bool getBancoDeRespostas () {
    return _bancoDePerguntas[_numQuAtual].r;
  }

  bool conferindoExecucao() {
    if (_numQuAtual >= _bancoDePerguntas.length -1) {
      print('Chegou na última pergunta do quiz');
      return true;

    } else {
      return false;
    }
  }

  int contadorDeAcertos () {
    return resp++;
  }

  resetandoAcertos(){
    resp = 0;

  }
  resetandoQuiz() {
    _numQuAtual = 0;
  }

}
