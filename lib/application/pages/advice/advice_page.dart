import 'package:clean_architecture/application/core/services/theme_service.dart';
// import 'package:clean_architecture/application/pages/advice/bloc/advice_bloc.dart';
import 'package:clean_architecture/application/pages/advice/cubit/advicer_cubit.dart';
import 'package:clean_architecture/application/pages/advice/widgets/advice_field.dart';
import 'package:clean_architecture/application/pages/advice/widgets/custom_button.dart';
import 'package:clean_architecture/application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => AdviceBloc(),
      create: (context) => AdvicerCubit(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Advicer", style: themeData.textTheme.bodyLarge),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) =>
                Provider.of<ThemeService>(context, listen: false).toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<AdvicerCubit, AdvicerCupitState>(
                  builder: (context, state) {
                    if (state is AdviceInitial) {
                      return Text(
                        'Your Advice waiting for you!',
                        style: themeData.textTheme.displayLarge,
                      );
                    } else if (state is AdviceStateLoading) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    } else if (state is AdviceStateLoaded) {
                      return AdviceField(advice: state.advice);
                    } else if (state is AdviceStateError) {
                      return ErrorMessage(message: state.errorMessage);
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(child: CustomButton()),
            ),
          ],
        ),
      ),
    );
  }
}
