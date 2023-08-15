// //abstract factory is a way to provide an interface for creating families of related or dependent objects
// // without specifying their concrete classes.
// // is a super set of factory method

// import 'package:flutter/material.dart';
// import 'package:flutter_experiment/DESIGN_PATTERNS/platfrom_indicator.dart';
// // import 'package:playground/platform_button.dart';
// // import 'package:playground/platform_indicator.dart';

// import 'factory_method_pattern.dart';

// // Approach 1
// // PlatformButton and PlatformIndicator created using Factory Method Pattern.

// abstract class AbstractFactory {
//   Widget buildButton(BuildContext context, String text, VoidCallback onPressed);
//   Widget buildIndicator(BuildContext context);
// }

// class AbstractFactoryImpl implements AbstractFactory {
//   @override
//   Widget buildButton(BuildContext context, String text, VoidCallback onPressed) {
//     return PlatformButton(Theme.of(context).platform).build(
//       onPressed,
//       Text(text),
//     );
//   }

//   @override
//   Widget buildIndicator(BuildContext context) {
//     return PlatfromIndicator(Theme.of(context).platform).build();
//   }
// }