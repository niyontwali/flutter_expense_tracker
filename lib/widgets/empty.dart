import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(description),
    );
  }
}
