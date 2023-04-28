part of 'localizations_cubit.dart';

abstract class LocalizationsState {
}

class LocalizationsLoadingState extends LocalizationsState{}

class ChangeLocaleState extends LocalizationsState{
  final Locale locale;

  ChangeLocaleState({required this.locale});

}