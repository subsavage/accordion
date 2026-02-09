import 'package:flutter/material.dart';

class ImageRowOverflow extends StatelessWidget {
  final List<String> images;
  final double itemSize;
  final double spacing;

  const ImageRowOverflow({super.key, required this.images, this.itemSize = 80, this.spacing = 8});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      final fullItem = itemSize + spacing;
      int canFit = ((maxWidth + spacing) / fullItem).floor();
      if (canFit < 1) canFit = 1;

      if (images.length <= canFit) {
        return Row(
          children: images
              .map((url) => Padding(
                    padding: EdgeInsets.only(right: spacing),
                    child: _buildImage(url),
                  ))
              .toList(),
        );
      }

      // Reserve one slot for the "+N" badge
      int show = canFit - 1;
      if (show < 1) show = 1;
      final visible = images.take(show).toList();
      final remaining = images.length - show;

      return Row(
        children: [
          ...visible.map((url) => Padding(padding: EdgeInsets.only(right: spacing), child: _buildImage(url))),
          _buildOverflowTile(images[show], remaining),
        ],
      );
    });
  }

  Widget _buildImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        width: itemSize,
        height: itemSize,
        fit: BoxFit.cover,
        errorBuilder: (c, e, s) => Container(
          width: itemSize,
          height: itemSize,
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, size: 28, color: Colors.black45),
        ),
      ),
    );
  }

  Widget _buildOverflowTile(String previewUrl, int remaining) {
    return Stack(
      children: [
        _buildImage(previewUrl),
        Container(
          width: itemSize,
          height: itemSize,
          decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(8)),
        ),
        SizedBox(
          width: itemSize,
          height: itemSize,
          child: Center(
            child: Text(
              '+$remaining',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
