import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haven/haven/features/auth/presentation/bloc/auth_bloc.dart';

List<BlocProvider> blocs = [
  BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
];
