import 'package:flutter/material.dart';
import 'package:imc_calculator/features/domain/entities/result.dart';

class ResultWidget extends StatelessWidget {
  final double _imc;

  const ResultWidget(this._imc, {Key? key}) : super(key: key);

  Color getColorFromResultId(String id) {
    Color color;

    switch (id) {
      case "1":
        color = Colors.red.shade600;
        break;
      case "2":
        color = Colors.yellow.shade600;
        break;
      case "3":
        color = Colors.green.shade600;
        break;
      case "4":
        color = Colors.yellow.shade600;
        break;
      case "5":
        color = Colors.orange.shade900;
        break;
      case "6":
        color = Colors.red.shade600;
        break;
      default:
        color = Colors.blue.shade600;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    final _result = Result(_imc).result;
    Color _resultColor = getColorFromResultId("${_result["id"]}");

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: SizedBox(
            height: 240,
            child: Image.asset(
              "${_result["image"]}",
              color: _resultColor,
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
                  "IMC: ${_imc.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 28.0,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${_result["title"]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                    color: _resultColor,
                  ),
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
              "${_result["risks"]}",
              style: const TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
