import 'package:flutter/material.dart';
import 'package:imc_calculator/features/presenter/widgets/result_widget.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResultPageState();
}

class _ResultPageState extends State {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, double>;

    double imc = args["imc"]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado/IMC"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ResultWidget(imc),
      ),
    );
  }
}
