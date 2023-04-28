import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/presentation/widgets/coustom_bottom_nav_bar.dart';
import '../../../bussines_logic/cubit/localizations/localizations_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<LocalizationsCubit, LocalizationsState>(
          builder: (BuildContext context, LocalizationsState state) {
          if(state is ChangeLocaleState){
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              color: Colors.blue.withOpacity(.2),
              child: DropdownButton<String>(
                items: ['ar', 'en']
                    .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
                    .toList(),
                value: state.locale.languageCode,
                onChanged: (String? value) {
                  if (value != null) {
                    context.read<LocalizationsCubit>().changeAppLanguage(value);
                  }
                },
              ),
            );
          }
          return const Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
