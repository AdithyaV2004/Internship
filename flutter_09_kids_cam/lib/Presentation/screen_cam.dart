import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ScreenCam extends StatefulWidget {
  const ScreenCam({super.key});

  @override
  State<ScreenCam> createState() => _ScreenCamState();
}

class _ScreenCamState extends State<ScreenCam> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  double _opacity = 0.5;

  late String imagePath;
  late bool isAsset;

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    imagePath = args['path'];
    isAsset = args['isAsset'];
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  Future<void> _setupCameraController() async {
    final List<CameraDescription> _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      cameraController = CameraController(
        _cameras.first,
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await cameraController!.initialize();
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Overlay Camera"), centerTitle: true),
      body: cameraController == null || !cameraController!.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Center(child: CameraPreview(cameraController!)),
                Opacity(
                  opacity: _opacity,
                  child: isAsset
                      ? Image.asset(
                          imagePath,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.contain,
                        )
                      : Image.file(
                          File(imagePath),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.contain,
                        ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Slider(
                        value: _opacity,
                        min: 0.0,
                        max: 1.0,
                        onChanged: (val) {
                          setState(() => _opacity = val);
                        },
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
