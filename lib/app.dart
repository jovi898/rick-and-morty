import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/config/router.dart';
import 'package:rick_and_morty/config/theme.dart';
import 'package:rick_and_morty/features/details/state/details/details_cubit.dart';
import 'package:rick_and_morty/features/home/state/home_cubit.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (BuildContext context) => HomeCubit()),
        BlocProvider<DetailsCubit>(create: (BuildContext context) => DetailsCubit(),)
      ], 
    child: MaterialApp.router(
      title: 'Rick And Morty',
      theme: theme,
      routerConfig: AppRouterHelper.router,
    ));
  }
}
