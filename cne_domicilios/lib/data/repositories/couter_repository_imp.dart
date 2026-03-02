import 'package:app_core/utils/result.dart';
import 'package:cne_domicilios/data/repositories/couter_repository.dart';
import 'package:cne_domicilios/domain/models/couter.dart';

final class CouterRepositoryImp extends CouterRepository {
  int _count = 0;

  @override
  Future<Result<Counter>> increment() async {
    ++_count;

    return Result.ok(Counter(value: _count));
  }
}
