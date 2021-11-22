import 'package:app_calculadora/main.dart';
import 'package:app_calculadora/models/CalBotao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class CalAppState extends State<MyApp> {
  String visorCalc = '';

  void numClique(String text) {
    setState(() => visorCalc += text);
  }

  void limparTudo(String text) {
    setState(() {
      visorCalc = '';
    });
  }

  void limpar(String text) {
    setState(() {
      visorCalc = visorCalc.substring(0, visorCalc.length - 1);
    });
  }

  void calcular(String text) {
    Parser p = Parser();
    Expression exp = p.parse(visorCalc);
    ContextModel cm = ContextModel();

    setState(() {
      visorCalc = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: const Text('Calculadora'),
              titleTextStyle: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                fontSize: 35,
                color: Colors.amber,
              )),
            ),
            backgroundColor: const Color(0xFF000000),
            body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: Text(
                    visorCalc,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalBotao("AC", 0xFFFFA726, limparTudo),
                          CalBotao("%", 0xFFFFA726, numClique),
                          CalBotao("/", 0xFFFFA726, numClique),
                          CalBotao("C", 0xFFFFA726, limpar)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalBotao("7", 0xFFD32F2F, numClique),
                          CalBotao("8", 0xFFD32F2F, numClique),
                          CalBotao("9", 0xFFD32F2F, numClique),
                          CalBotao("*", 0xFFFFA726, numClique)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalBotao("4", 0xFFD32F2F, numClique),
                          CalBotao("5", 0xFFD32F2F, numClique),
                          CalBotao("6", 0xFFD32F2F, numClique),
                          CalBotao("-", 0xFFFFA726, numClique),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalBotao("1", 0xFFD32F2F, numClique),
                          CalBotao("2", 0xFFD32F2F, numClique),
                          CalBotao("3", 0xFFD32F2F, numClique),
                          CalBotao("+", 0xFFFFA726, numClique)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalBotao(".", 0xFFD32F2F, numClique),
                          CalBotao("0", 0xFFD32F2F, numClique),
                          CalBotao("00", 0xFFD32F2F, numClique),
                          CalBotao("=", 0xFFFFA726, calcular),
                        ])
                  ],
                ),
              )
            ])));
  }
}
