// ignore_for_file: must_be_immutable

//import 'dart:js';

//import 'package:brasileirao/models/time.dart';
//import 'package:brasileirao/models/titulo.dart';
//import 'package:brasileirao/repositories/time_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../models/time.dart';
import '../models/titulo.dart';
import '../repositories/time_repository.dart';

class AddTituloPage extends StatefulWidget {
  Time time;

  AddTituloPage({
    super.key,
    required this.time,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AddTituloPageState createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  save() {
    Provider.of<TimesRepository>(context, listen: false).addTitulo(
      time: widget.time,
      titulo: Titulo(campeonato: _campeonato.text, ano: _ano.text),
    );

//    Navigator.pop(context);
    Get.back();
    Get.snackbar('Sucesso!', 'Titulo Cadastrado!',
        colorText: Colors.white,
        backgroundColor: Colors.yellow[900],
        snackPosition: SnackPosition.BOTTOM);
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(const SnackBar(content: Text('Salvo com Sucesso !')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.time.cor,
        title: const Text('Adicionar Titulo'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
                controller: _ano,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ano',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  return value!.isEmpty ? 'Informe o Ano do Titulo' : null;
                },
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: TextFormField(
                controller: _campeonato,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Campeonato',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe qual é o Campeonato';
                  }
                  return null;
                },
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(24.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
//                      addTitulo(Titulo(campeonato: _campeonato.text, ano: _ano.text), );
                      save();
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                      ),
                      Text(
                        'Salvar',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addTitulo(Titulo titulo) {
    setState(() {
      widget.time.titulos.add(titulo);
    });

  }
}
