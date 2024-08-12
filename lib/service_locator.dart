import 'package:get_it/get_it.dart';
import 'package:shopliax/controllers/placeholder/placeholder_bloc.dart';

import 'controllers/todo/todo_bloc.dart'; 
final getIt = GetIt.instance;

void initializeSingletons() {
  getIt.registerSingleton<TodoBloc>(TodoBloc());
  getIt.registerSingleton<PlaceholderBloc>(PlaceholderBloc());
}



TodoBloc get $todoBloc => getIt.get<TodoBloc>();
PlaceholderBloc get $placeholderBloc => getIt.get<PlaceholderBloc>();