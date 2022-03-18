import 'package:flutter/material.dart';
import 'package:imc_calculator/features/domain/entities/calculator.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    double containerWidth = double.infinity;

    if (media.size.width >= 384) {
      containerWidth = 240;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo de IMC"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
        key: _formKey,
        child: Center(
          child: SizedBox(
            width: containerWidth,
            height: media.size.height,
            child: Padding(
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
                          "images/imc_2.png",
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "IMC",
                      style: TextStyle(
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Índice de Massa Corporal",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: TextFormField(
                            validator: (value) {
                              if (double.tryParse(value!) == null) {
                                return 'Altura inválida';
                              }
                              return null;
                            },
                            style: const TextStyle(fontSize: 14.0),
                            strutStyle: const StrutStyle(height: 1),
                            keyboardType: TextInputType.number,
                            controller: _heightController,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Altura em metros',
                              hintText: 'Ex.: 1.70',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          style: const TextStyle(fontSize: 14.0),
                          keyboardType: TextInputType.number,
                          controller: _weightController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Peso em kg',
                            hintText: 'Ex.: 70.5',
                          ),
                          validator: (value) {
                            if (double.tryParse(value!) == null) {
                              return 'Peso inválido';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40), elevation: 0),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var height = double.parse(_heightController.text);
                          var weight = double.parse(_weightController.text);
                          var imc = Calculator(height, weight).result;

                          Map<String, double> args = {'imc': imc};
                          Navigator.pushNamed(
                            context,
                            '/result',
                            arguments: args,
                          );
                        }
                      },
                      child: const Text(
                        'Calcular IMC',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
