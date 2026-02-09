import 'package:flutter/material.dart';
import '../widgets/image_row_overflow.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // sample data: groups of image urls with varying lengths
  List<List<String>> get groups => List.generate(
        6,
        (i) => List.generate(
          (i + 1) * 2 + (i % 3 == 0 ? 5 : 0),
          (j) => 'https://picsum.photos/seed/${i}_$j/200',
        ),
      );

  @override
  Widget build(BuildContext context) {
    final items = groups;
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final images = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ExpansionTile(
            title: Text('Gallery ${index + 1} (${images.length})'),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            children: [
              ImageRowOverflow(images: images),
            ],
          ),
        );
      },
    );
  }
}
