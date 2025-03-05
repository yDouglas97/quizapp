import 'package:flutter/material.dart';
import 'helper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Helper helper = Helper();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void conferirRespostas(bool confere) {

    setState(() {
      if (helper.conferindoExecucao()) {
        Alert(context: context, title: "Fim do QUIZ", desc: "Você chegou ao FIM do QUIZ.").show();
        helper.resetandoQuiz();
        marcadorDePontos.clear();

      } else {
        if (confere == helper.getBancoDeRespostas()) {
          marcadorDePontos.add(Icon(Icons.check, color: Colors.green,));
        } else {
          marcadorDePontos.add(Icon(Icons.close, color: Colors.red,));
        }
        helper.proximaPergunta();
      }
    });
  }

  List<Icon> marcadorDePontos = [
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                helper.getBancoDePerguntas(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Cor de fundo
                foregroundColor: Colors.white, // Cor do texto
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                conferirRespostas(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade800, // Cor de fundo
                foregroundColor: Colors.white, // Cor do texto
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                conferirRespostas(false);
              },
            ),
          ),
        ),
       Row(
         children: marcadorDePontos,
       )
      ],
    );
  }
}