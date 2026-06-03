import 'package:flutter/material.dart';

class BrandsRow extends StatelessWidget {
  const BrandsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Image.asset(
        'assets/images/compose.webp',
        fit: BoxFit.contain,
        width: double.infinity,
      ),
    );
  }
}
