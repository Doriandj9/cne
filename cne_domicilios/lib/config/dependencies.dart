import 'package:cne_domicilios/config/env.dart';
import 'package:cne_domicilios/data/repositories/couter_repository.dart';
import 'package:cne_domicilios/data/repositories/couter_repository_imp.dart';
import 'package:cne_domicilios/data/repositories/posts/post_repository.dart';
import 'package:cne_domicilios/data/repositories/posts/post_repository_impl.dart';
import 'package:cne_domicilios/data/services/api/api_client.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get appProviders {
  return [
    Provider(create: (context) => CouterRepositoryImp() as CouterRepository),
    Provider(create: (context) => ApiClient(uri: Uri.parse(Env.apiUrl))),
    Provider(
      create: (contex) =>
          PostRepositoryImpl(apiClient: contex.read()) as PostRepository,
    ),
  ];
}
