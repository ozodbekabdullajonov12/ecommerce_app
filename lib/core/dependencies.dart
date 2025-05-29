import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;
import 'package:store/core/client.dart';
import 'package:store/core/connection_state.dart';
import 'package:store/data/repositories/auth_repository.dart';
import 'package:store/data/repositories/product_repositories/product_repository.dart';
import 'package:store/data/repositories/product_repositories/product_repository_local.dart';
import 'package:store/data/repositories/product_repositories/product_repository_remote.dart';
import 'package:store/data/repositories/new_card_repository.dart';
import 'package:store/data/repositories/notification_repository.dart';
import 'package:store/data/repositories/payment_repository.dart';

import 'package:store/data/repositories/search_history_repository.dart';
import 'package:store/data/repositories/review_repository.dart';



final List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),
  Provider(create: (context) => AuthRepository(client: context.read())),
  BlocProvider(create: (context) => ConnectionStateCubit(),),
  RepositoryProvider(create: (context) => ProductRepositoryLocal(),),
  RepositoryProvider(create: (context) => ProductRepositoryRemote(client: context.read()),),
  RepositoryProvider(create: (context) => ProductRepository(localRepo: context.read(), remoteRepo: context.read(), connectionCubit: context.read(),),),
  Provider(create: (context) => SearchHistoryRepository(),),
  Provider(create: (context) => ReviewRepository(client: context.read()),),
  Provider(create: (context) => NotificationRepository(client: context.read())),
  Provider(create: (context) => PaymentRepository(client: context.read())),
  Provider(create: (context) => NewCardRepository(client: context.read())),
];
