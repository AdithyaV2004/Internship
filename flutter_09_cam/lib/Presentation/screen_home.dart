import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imagePaths = [
    'assets/draw.jpg',
    'assets/draw2.webp',
    'assets/draw3.jpg',
    'assets/draw4.avif',
    'assets/draw5.jpg',
  ];

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      Navigator.pushNamed(
        // ignore: use_build_context_synchronously
        context,
        '/image',
        arguments: {'path': pickedFile.path, 'isAsset': false},
      );
    }
  }

  void _openAssetImage(String assetPath) {
    Navigator.pushNamed(
      context,
      '/image',
      arguments: {'path': assetPath, 'isAsset': true},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select an Image")),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: imagePaths.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _openAssetImage(imagePaths[index]),
                  child: Image.asset(imagePaths[index], fit: BoxFit.cover),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton.icon(
              onPressed: _pickFromGallery,
              icon: const Icon(Icons.photo_library),
              label: const Text("Pick from Gallery"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
