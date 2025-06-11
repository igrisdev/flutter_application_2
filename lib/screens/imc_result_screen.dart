import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_colors.dart';
import 'package:flutter_application_2/core/text_styles.dart';
import 'package:flutter_application_2/screens/imc_home_screen.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;

  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tu Resultado",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      getTitleByWeight(imcResult).toUpperCase(),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: getColorByWeight(imcResult),
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 56,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        getDescriptionByWeight(imcResult),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 26,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImcHomeScreen(
                        // height: selectedHeight,
                        // weight: selectedWeight,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(AppColors.primary),
                ),
                child: Text('Calcular', style: TextStyles.bodyText),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text('Resultado'),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }

  Color getColorByWeight(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue, // IMC Bajo
      < 24.9 => Colors.green, // IMC Normal
      < 29.9 => Colors.orange, // Sobrepeso
      _ => Colors.red, // Obesidad
    };
  }

  String getTitleByWeight(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Imc Bajo",
      < 24.9 => "Imc Normal",
      < 29.9 => "Sobrepeso",
      _ => "Obesidad",
    };
  }

  String getDescriptionByWeight(double imcResult) {
    return switch (imcResult) {
      < 18.5 =>
        "Tu IMC es bajo, no es recomendable realizar ejercicios de alto impacto.",
      < 24.9 => "Tu IMC es normal, puedes realizar ejercicios de alto impacto.",
      < 29.9 =>
        "Tu IMC es sobrepeso, puedes realizar ejercicios de alto impacto.",
      _ =>
        "Tu IMC es obesidad, no es recomendable realizar ejercicios de alto impacto.",
    };
  }
}
