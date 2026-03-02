import 'package:app_core/utils/result.dart';
import 'package:cne_domicilios/domain/models/couter.dart';

abstract class CouterRepository {
  Future<Result<Counter>> increment();
}
