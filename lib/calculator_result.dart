import 'package:flutter/material.dart';

class CalculatorResult extends StatefulWidget {
  const CalculatorResult({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalculatorResultState();
}

class _CalculatorResultState extends State with TickerProviderStateMixin {
  final List<Map<String, dynamic>> infoList = [
    {
      "title": "Muito abaixo do peso",
      "risks":
          "Anorexia, Bulimia, Osteoporose e auto consumo de massa muscular.",
      "color": Colors.red.shade600,
      "image": "images/imc_1.png",
    },
    {
      "title": "Abaixo do peso",
      "risks":
          "Transtornos digestivos, debilidade, fadiga crônica, Stress, Ansiedade.",
      "color": Colors.yellow.shade600,
      "image": "images/imc_1.png",
    },
    {
      "title": "Peso normal",
      "risks": "Em bom estado geral, boa vitalidade e boa aparência física",
      "color": Colors.green.shade600,
      "image": "images/imc_2.png",
    },
    {
      "title": "Acima do peso",
      "risks":
          "Fadiga, problemas digestivos, problemas circulatórios, má circulação, varizes.",
      "color": Colors.yellow.shade600,
      "image": "images/imc_3.png",
    },
    {
      "title": "Obesidade",
      "risks":
          "Diabetes, angina de peito, enfarto, trombo flebites, arterosclerose, "
              "embolias, alterações menstruais.",
      "color": Colors.orange.shade900,
      "image": "images/imc_4.png",
    },
    {
      "title": "Obesidade mórbida",
      "risks":
          "Falta de ar, apneia, sonolência, trombose pulmonar, úlceras varicosas, "
              "cancro do colon, refluxo esofágico.",
      "color": Colors.red.shade600,
      "image": "images/imc_4.png",
    },
  ];

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..reset()..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var info = infoList[0];
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, double>;

    double imc = args["imc"]!;

    if (imc < 15) {
      info = infoList[0];
    } else if (imc >= 15 && imc <= 18.5) {
      info = infoList[1];
    } else if (imc >= 18.6 && imc <= 24.9) {
      info = infoList[2];
    } else if (imc >= 25 && imc <= 29.9) {
      info = infoList[3];
    } else if (imc >= 30 && imc <= 39.9) {
      info = infoList[4];
    } else if (imc >= 40) {
      info = infoList[5];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado/IMC"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: _controller,
                curve: Curves.fastOutSlowIn,
              ),
              axis: Axis.vertical,
              axisAlignment: -1,
              child: Center(
                child: SizedBox(
                  height: 240,
                  child: Image.asset(
                    info["image"],
                    color: info["color"],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "IMC: ${imc.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      info["title"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w800,
                          color: info["color"]),
                    ),
                  ),
                ],
              ),
            ),
            const Center(
                child: Text(
              "Condições de saúde relacionadas:",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  info["risks"],
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
