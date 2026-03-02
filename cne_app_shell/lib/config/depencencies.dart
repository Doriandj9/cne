import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get shellProviders {
  return [Provider(create: (context) => Object())];
}
