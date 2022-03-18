import 'package:flutter/material.dart';
import 'package:imc_calculator/features/presenter/form_page.dart';
import 'package:imc_calculator/features/presenter/result_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.red,
          onPrimary: Colors.white
        )
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.red,
          onPrimary: Colors.white
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FormPage(),
        '/result': (context) => const ResultPage(),
      },
    );
  }
}
