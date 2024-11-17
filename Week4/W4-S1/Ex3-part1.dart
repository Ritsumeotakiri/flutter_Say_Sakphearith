import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label; 
  final IconData icon; 
  final IconPosition iconPosition; 
  final ButtonType buttonType; 

  const CustomButton({
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;

    switch (buttonType) {
      case ButtonType.secondary:
        buttonColor = Colors.green;
        break;
      case ButtonType.disabled:
        buttonColor = Colors.grey;
        break;
      case ButtonType.primary:
      default:
        buttonColor = Colors.blue;
        break;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
      ),
      onPressed: buttonType == ButtonType.disabled ? null : () {
        print('$label button pressed!');
      },
      child: iconPosition == IconPosition.left
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon), 
                SizedBox(width: 8), 
                Text(label), 
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label), 
                SizedBox(width: 8), 
                Icon(icon), 
              ],
            ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Button Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
                buttonType: ButtonType.primary,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: 'Cancel',
                icon: Icons.cancel,
                buttonType: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: 'Disabled',
                icon: Icons.block,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
