class Result {
  final double _imc;
  Result(this._imc);

  final List<Map<String, String>> _descriptionList = [
    {
      "id": "1",
      "title": "Muito abaixo do peso",
      "risks":
          "Anorexia, Bulimia, Osteoporose e auto consumo de massa muscular.",
      "image": "images/imc_1.png",
    },
    {
      "id": "2",
      "title": "Abaixo do peso",
      "risks":
          "Transtornos digestivos, debilidade, fadiga crônica, Stress, Ansiedade.",
      "image": "images/imc_1.png",
    },
    {
      "id": "3",
      "title": "Peso normal",
      "risks": "Em bom estado geral, boa vitalidade e boa aparência física",
      "image": "images/imc_2.png",
    },
    {
      "id": "4",
      "title": "Acima do peso",
      "risks":
          "Fadiga, problemas digestivos, problemas circulatórios, má circulação, varizes.",
      "image": "images/imc_3.png",
    },
    {
      "id": "5",
      "title": "Obesidade",
      "risks":
          "Diabetes, angina de peito, enfarto, trombo flebites, aterosclerose, "
              "embolias, alterações menstruais.",
      "image": "images/imc_4.png",
    },
    {
      "id": "6",
      "title": "Obesidade mórbida",
      "risks":
          "Falta de ar, apneia, sonolência, trombose pulmonar, úlceras varicosas, "
              "cancro do colon, refluxo esofágico.",
      "image": "images/imc_4.png",
    },
  ];

  final Map<String, String> _defaultDescription = {
    "id": "0",
    "title": "Desconhecido",
    "risks": "Desconhecido.",
    "image": "images/imc_2.png",
  };

  Map<String, String> get result {
    if (_imc <= 0) {
      // Desconhecido
      return _defaultDescription;
    } else if (_imc < 15) {
      // Muito abaixo do peso
      return _descriptionList[0];
    } else if (_imc >= 15 && _imc <= 18.5) {
      // Abaixo do peso
      return _descriptionList[1];
    } else if (_imc >= 18.6 && _imc <= 24.9) {
      // Peso normal
      return _descriptionList[2];
    } else if (_imc >= 25 && _imc <= 29.9) {
      // Acima do peso
      return _descriptionList[3];
    } else if (_imc >= 30 && _imc <= 39.9) {
      // Obesidade
      return _descriptionList[4];
    } else if (_imc >= 40) {
      // Obesidade mórbida
      return _descriptionList[5];
    }

    // Desconhecido
    return _defaultDescription;
  }
}
