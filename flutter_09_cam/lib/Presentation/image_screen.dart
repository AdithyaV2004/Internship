import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late CameraController _cameraController;
  bool _isCameraInitialized = false;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
      );

      _cameraController = CameraController(
        backCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await _cameraController.initialize();
      if (mounted) {
        setState(() => _isCameraInitialized = true);
      }
    } catch (e) {
      debugPrint('Camera initialization failed: $e');
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final String path = args['path'];
    final bool isAsset = args['isAsset'];

    return Scaffold(
      appBar: AppBar(title: const Text("Selected Image")),
      body: Stack(
        children: [
          // Live camera feed as the background
          if (_isCameraInitialized)
            CameraPreview(_cameraController)
          else
            const Center(child: CircularProgressIndicator()),

          // Selected image overlay
          Center(
            child: Opacity(
              opacity: _opacity,
              child: isAsset ? Image.asset(path) : Image.file(File(path)),
            ),
          ),

          // Slider to control image opacity
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Column(
              children: [
                Slider(
                  value: _opacity,
                  onChanged: (value) {
                    setState(() => _opacity = value);
                  },
                  min: 0.0,
                  max: 1.0,
                ),
                const Text("Adjust Image Opacity"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
