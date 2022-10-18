import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectCalc extends StatefulWidget {
  const ProjectCalc({Key? key}) : super(key: key);

  @override
  State<ProjectCalc> createState() => _ProjectCalcState();
}

class _ProjectCalcState extends State<ProjectCalc> {
  final _formKey = GlobalKey<FormState>();
  final valorBeneficio = TextEditingController();
  String msg1 = ' ';
  String msg2 = ' ';
  String msg3 = ' ';
  String msg4 = ' ';

  void _calcular() {
    setState(() {
      NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
      double valor = double.parse(valorBeneficio.text);
      String valorForm = formatter.format(valor);
      double valorBeneficioMensal = 400;
      double valorTotalConsignado = 2500;

      double porcentagemBeneficio = 40 / 100 * valor;
      double.parse(porcentagemBeneficio.toStringAsPrecision(2));
      String porcentagemBeneficioForm = formatter.format(porcentagemBeneficio);

      double resultado = valor * valorTotalConsignado / valorBeneficioMensal;
      String resultadoForm = formatter.format(resultado);

      double parcelas = valor - porcentagemBeneficio;
      String parcelasForm = formatter.format(parcelas);

      msg1 = 'Valor informado : $valorForm';
      msg2 = '40% do valor informado : $porcentagemBeneficioForm';
      msg3 = 'Valor do consignado : $resultadoForm';
      msg4 = 'Valor MENSAL atualizado : $parcelasForm';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(
                onPressed: () => Navigator.pop(context),
              ),
              const Text(
                "Cálculo automático do valor total liberado do consignado, com porcentagem de 40%, e valor das parcelas em 24x.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              TextFormField(
                controller: valorBeneficio,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label:
                      Text("Insira o valor do benefício para base de cálculo"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe um valor";
                  } else if (value.contains(' ') ||
                      value.contains('-') ||
                      value.contains(',')) {
                    return "O valor informado é inválido";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _calcular();
                  }
                  final int? valor = int.tryParse(valorBeneficio.text);
                },
                child: const Text("Calcular"),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  msg1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  msg2,                  
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  msg3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  msg4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
