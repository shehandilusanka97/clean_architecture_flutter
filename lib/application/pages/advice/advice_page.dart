import 'package:clean_architecture/application/core/services/theme_service.dart';
import 'package:clean_architecture/application/pages/advice/widgets/advice_field.dart';
import 'package:clean_architecture/application/pages/advice/widgets/custom_button.dart';
import 'package:clean_architecture/application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: 
                ErrorMessage(message: "Opopss! Something went wrong"),
                //  AdviceField(advice: 'Your Advice waiting for you!'),
                // CircularProgressIndicator(
                //   color: themeData.colorScheme.secondary,
                // )
                //  Text(
                //   'Your Advice waiting for you!',
                //   style: themeData.textTheme.displayLarge,
                // ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(child: CustomButton()),
            ),
          ],
        ),
      ),
    );
  }
}
