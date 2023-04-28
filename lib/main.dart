import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/bussines_logic/cubit/localizations/localizations_cubit.dart';
import 'package:news_app/presentation/screens/home_screen/home_screen.dart';

import 'core/app_localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          LocalizationsCubit()..getSavedLanguage(),
      child: BlocBuilder<LocalizationsCubit, LocalizationsState>(
        builder: (BuildContext context, LocalizationsState state) {
          if (state is ChangeLocaleState) {
            return MaterialApp(
              locale: state.locale,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                ...GlobalCupertinoLocalizations.delegates,
                ...GlobalMaterialLocalizations.delegates,
                GlobalWidgetsLocalizations.delegate,
              ],
              localeResolutionCallback: (deviceLocal, supportedLocales) {
                for (var local in supportedLocales) {
                  if (deviceLocal != null &&
                      deviceLocal.languageCode == local.languageCode) {
                    return deviceLocal;
                  }
                }
                return supportedLocales.first;
              },
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white,
              ),
              home: const HomeScreen(),
            );
          }
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizations.delegate,
              ...GlobalCupertinoLocalizations.delegates,
              ...GlobalMaterialLocalizations.delegates,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
