import '../models/time.dart';
import '../models/titulo.dart';
import '../repositories/time_repository.dart';

class HomeController {
  late TimesRepository timesRepository;
  List<Time> get tabela => timesRepository.times;

  HomeController() {
    timesRepository = TimesRepository();
  }
}
