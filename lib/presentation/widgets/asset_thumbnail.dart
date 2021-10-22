import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final AssetEntity asset;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: asset.thumbData,
      builder: (context, snapshot) {
        final bytes = snapshot.data;
        // If we have no data, display a spinner
        if (bytes == null) {
          return const CircularProgressIndicator();
        } else {
          return GestureDetector(
            onTap: () {
              
            },
            child: Image.memory(
              bytes,
              fit: BoxFit.cover,
            ),
          );
        }
      },
    );
  }
}
