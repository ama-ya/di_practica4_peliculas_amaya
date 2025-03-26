import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
                onPressed: onClicked,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF212C31),
                  elevation: 8.0,
                ),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
      ),
    );
  }
}
