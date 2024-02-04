import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text('0 Scheduled Service ! Schedule Now '),
        Icon(Icons.create_new_folder_outlined),
      ],
    );
  }
}
