class Titulo {
  String campeonato;
  String ano;

  Titulo({required this.campeonato, required this.ano});

  @override
  String toString() {
    return ' campeão do $campeonato no ano $ano';
  }
}
