import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;
import 'package:store/core/client.dart';
import 'package:store/data/repositories/auth_repository.dart';
import 'package:store/data/repositories/product_repository.dart';

final List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),
  Provider(create: (context) => AuthRepository(client: context.read())),
  Provider(create: (context) => ProductRepository(client: context.read())),
];
