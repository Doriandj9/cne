import 'package:app_core/utils/command.dart';
import 'package:app_core/utils/result.dart';
import 'package:cne_domicilios/data/repositories/couter_repository.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.couterRepository}) {
    increment = Command0(_increment);
  }

  final CouterRepository couterRepository;
  final Logger log = Logger('HomeViewModel');
  late Command0 increment;

  int count = 0;

  Future<Result<void>> _increment() async {
    final resut = await couterRepository.increment();
    switch (resut) {
      case Ok():
        count = resut.value.value;
        notifyListeners();
      case Error():
        log.warning('Error al cargar el valor');
        return Result.error(Exception('Error: 505'));
    }

    return resut;
  }
}
