import 'package:cne_domicilios/data/repositories/couter_repository.dart';
import 'package:cne_domicilios/data/repositories/couter_repository_imp.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get appProviders {
  return [
    Provider(create: (context) => CouterRepositoryImp() as CouterRepository),
  ];
}
