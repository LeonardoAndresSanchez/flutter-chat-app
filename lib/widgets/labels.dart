import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String? route;
  final String? label;
  final String? subLabel;
  const Labels({
    super.key,
    @required this.route,
    @required this.label,
    @required this.subLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label!,
          style: const TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, route!);
          },
          child: Text(
            subLabel!,
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
