import 'dart:collection';

import 'package:flutter/material.dart';
//import '../database/db.dart';
import '../models/time.dart';
import '../models/titulo.dart';

class TimesRepository extends ChangeNotifier {
  final List<Time> _times = [];

  // ignore: unnecessary_this
  UnmodifiableListView<Time> get times => UnmodifiableListView(_times);

  void addTitulo({required Time time, required Titulo titulo}) {
    time.titulos.add(titulo);
    notifyListeners();
  }

  void editTitulo(
      {required Titulo titulo,
      required String ano,
      required String campeonato}) {
    titulo.campeonato = campeonato;
    titulo.ano = ano;
    notifyListeners();
  }

  static setupTimes() {
    return [];
/*    
    return [
      Time(
        id: 0,
        nome: 'Flamengo',
        pontos: 71,
        brasao: 'https://logodetimes.com/times/flamengo/logo-flamengo-256.png',
        cor: Color.fromARGB(255, 154, 12, 2),
      ),
      Time(
        id: 0,
        nome: 'Internacional',
        pontos: 70,
        brasao:
            'https://logodetimes.com/times/internacional/logo-internacional-256.png',
        cor: Color.fromARGB(194, 248, 16, 16),
      ),
      Time(
        id: 0,
        nome: 'Atlético-MG',
        pontos: 69,
        brasao:
            'https://logodetimes.com/times/atletico-mineiro/logo-atletico-mineiro-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        id: 0,
        nome: 'São Paulo',
        pontos: 69,
        brasao:
            'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png',
        cor: const Color.fromARGB(255, 229, 82, 255),
      ),
      Time(
        id: 0,
        nome: 'Fluminense',
        pontos: 67,
        brasao:
            'https://logodetimes.com/times/fluminense/logo-fluminense-256.png',
        cor: const Color.fromRGBO(0, 105, 92, 1),
      ),
      Time(
        id: 0,
        nome: 'Grêmio',
        pontos: 65,
        brasao: 'https://logodetimes.com/times/gremio/logo-gremio-256.png',
        cor: const Color.fromRGBO(13, 71, 161, 1),
      ),
      Time(
        id: 0,
        nome: 'Palmeiras',
        pontos: 65,
        brasao:
            'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png',
        cor: const Color.fromRGBO(46, 125, 50, 1),
      ),
      Time(
        id: 0,
        nome: 'Santos',
        pontos: 64,
        brasao: 'https://logodetimes.com/times/santos/logo-santos-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        id: 0,
        nome: 'Athletico-PR',
        pontos: 63,
        brasao:
            'https://logodetimes.com/times/atletico-paranaense/logo-atletico-paranaense-256.png',
        cor: const Color.fromRGBO(115, 7, 7, 1),
      ),
      Time(
        id: 0,
        nome: 'Corinthians',
        pontos: 62,
        brasao:
            'https://logodetimes.com/times/corinthians/logo-corinthians-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        id: 0,
        nome: 'Bragantino',
        pontos: 61,
        brasao:
            'https://logodetimes.com/times/red-bull-bragantino/logo-red-bull-bragantino-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        id: 0,
        nome: 'Ceará',
        pontos: 50,
        brasao: 'https://logodetimes.com/times/ceara/logo-ceara-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        id: 0,
        nome: 'Atlético-GO',
        pontos: 49,
        brasao:
            'https://logodetimes.com/times/atletico-goianiense/logo-atletico-goianiense-256.png',
        cor: const Color.fromRGBO(183, 28, 28, 1),
      ),
      Time(
        id: 0,
        nome: 'Sport',
        pontos: 48,
        brasao:
            'https://logodetimes.com/times/sport-recife/logo-sport-recife-256.png',
        cor: const Color.fromRGBO(183, 28, 28, 1),
      ),
      Time(
        id: 0,
        nome: 'Bahia',
        pontos: 47,
        brasao: 'https://logodetimes.com/times/bahia/logo-bahia-256.png',
        cor: const Color.fromRGBO(13, 71, 161, 1),
      ),
      Time(
        id: 0,
        nome: 'Fortaleza',
        pontos: 46,
        brasao:
            'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png',
        cor: const Color.fromRGBO(183, 28, 28, 1),
      ),
      Time(
        id: 0,
        nome: 'Vasco',
        pontos: 45,
        brasao:
            'https://logodetimes.com/times/vasco-da-gama/logo-vasco-da-gama-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        id: 0,
        nome: 'Goiás',
        pontos: 44,
        brasao:
            'https://logodetimes.com/times/goias/logo-goias-esporte-clube-256.png',
        cor: const Color.fromRGBO(27, 94, 32, 1),
      ),
      Time(
        id: 0,
        nome: 'Coritiba',
        pontos: 43,
        brasao: 'https://logodetimes.com/times/coritiba/logo-coritiba-5.png',
        cor: const Color.fromRGBO(27, 94, 32, 1),
      ),
      Time(
        id: 0,
        nome: 'Botafogo',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/botafogo/logo-botafogo-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
    ];
*/
  }

  TimesRepository() {
    //  initRepository();

    _times.addAll([
      Time(
        nome: 'Flamengo',
        pontos: 71,
        brasao: 'https://logodetimes.com/times/flamengo/logo-flamengo-256.png',
        cor: Color.fromARGB(255, 154, 12, 2),
      ),
      Time(
        nome: 'Internacional',
        pontos: 70,
        brasao:
            'https://logodetimes.com/times/internacional/logo-internacional-256.png',
        cor: Color.fromARGB(194, 248, 16, 16),
      ),
      Time(
        nome: 'Atlético-MG',
        pontos: 69,
        brasao:
            'https://logodetimes.com/times/atletico-mineiro/logo-atletico-mineiro-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        nome: 'São Paulo',
        pontos: 69,
        brasao:
            'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png',
        cor: const Color.fromARGB(255, 229, 82, 255),
      ),
      Time(
        nome: 'Fluminense',
        pontos: 67,
        brasao:
            'https://logodetimes.com/times/fluminense/logo-fluminense-256.png',
        cor: const Color.fromRGBO(0, 105, 92, 1),
      ),
      Time(
        nome: 'Grêmio',
        pontos: 65,
        brasao: 'https://logodetimes.com/times/gremio/logo-gremio-256.png',
        cor: const Color.fromRGBO(13, 71, 161, 1),
      ),
      Time(
        nome: 'Palmeiras',
        pontos: 65,
        brasao:
            'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png',
        cor: const Color.fromRGBO(46, 125, 50, 1),
      ),
      Time(
        nome: 'Santos',
        pontos: 64,
        brasao: 'https://logodetimes.com/times/santos/logo-santos-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        nome: 'Athletico-PR',
        pontos: 63,
        brasao:
            'https://logodetimes.com/times/atletico-paranaense/logo-atletico-paranaense-256.png',
        cor: const Color.fromRGBO(115, 7, 7, 1),
      ),
      Time(
        nome: 'Corinthians',
        pontos: 62,
        brasao:
            'https://logodetimes.com/times/corinthians/logo-corinthians-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        nome: 'Bragantino',
        pontos: 61,
        brasao:
            'https://logodetimes.com/times/red-bull-bragantino/logo-red-bull-bragantino-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        nome: 'Ceará',
        pontos: 50,
        brasao: 'https://logodetimes.com/times/ceara/logo-ceara-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        nome: 'Atlético-GO',
        pontos: 49,
        brasao:
            'https://logodetimes.com/times/atletico-goianiense/logo-atletico-goianiense-256.png',
        cor: const Color.fromRGBO(183, 28, 28, 1),
      ),
      Time(
        nome: 'Sport',
        pontos: 48,
        brasao:
            'https://logodetimes.com/times/sport-recife/logo-sport-recife-256.png',
        cor: const Color.fromRGBO(183, 28, 28, 1),
      ),
      Time(
        nome: 'Bahia',
        pontos: 47,
        brasao: 'https://logodetimes.com/times/bahia/logo-bahia-256.png',
        cor: const Color.fromRGBO(13, 71, 161, 1),
      ),
      Time(
        nome: 'Fortaleza',
        pontos: 46,
        brasao:
            'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png',
        cor: const Color.fromRGBO(183, 28, 28, 1),
      ),
      Time(
        nome: 'Vasco',
        pontos: 45,
        brasao:
            'https://logodetimes.com/times/vasco-da-gama/logo-vasco-da-gama-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
      Time(
        nome: 'Goiás',
        pontos: 44,
        brasao:
            'https://logodetimes.com/times/goias/logo-goias-esporte-clube-256.png',
//        brasao: 'https://logodetimes.com/download/?time=aHR0cHM6Ly9sb2dvZGV0aW1lcy5jb20vdGltZXMvZ29pYXMvbG9nby1nb2lhcy1lc3BvcnRlLWNsdWJlLTI1Ni5wbmc=',
        cor: const Color.fromRGBO(27, 94, 32, 1),
      ),
      Time(
        nome: 'Coritiba',
        pontos: 43,
        brasao: 'https://logodetimes.com/times/coritiba/logo-coritiba-5.png',
        cor: const Color.fromRGBO(27, 94, 32, 1),
      ),
      Time(
        nome: 'Botafogo',
        pontos: 0,
        brasao: 'https://logodetimes.com/times/botafogo/logo-botafogo-256.png',
        cor: const Color.fromRGBO(66, 66, 66, 1),
      ),
    ]);
  }
  /*
  initRepository() async {
    var db = DB.get();

    // codigo equivalente a d.rawQuery('SELECT * FROM times');
    List times = db.query('times');

    for (var time in times) {
      _times.add(
        Time(
          id: time['id'],
          nome: time['nome'],
          brasao: time['brasao'],
          pontos: time['pontos'],
          cor: Color(int.parse(time['cor'])),
        ),
      );
    }
    notifyListeners();
  }
  */
}
