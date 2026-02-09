import 'package:flutter/material.dart';
import '../widgets/image_row_overflow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? expandedIndex;

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
        final isExpanded = expandedIndex == index;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Collection ${index + 1} (${images.length} items)',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                trailing: Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.grey[700],
                ),
                onTap: () {
                  setState(() {
                    expandedIndex = isExpanded ? null : index;
                  });
                },
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: ImageRowOverflow(images: images),
                ),
                crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        );
      },
    );
  }
}
