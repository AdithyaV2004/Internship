import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenCam extends StatefulWidget {
  const ScreenCam({super.key});

  @override
  State<ScreenCam> createState() => _ScreenCamState();
}

class _ScreenCamState extends State<ScreenCam> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  double _opacity = 0.5;

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          style: ButtonStyle(iconSize: WidgetStatePropertyAll(30)),
          onPressed: () {
            SystemNavigator.pop(); // Exits the app
          },
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
        title: Text(
          "KidsCam",
          style: TextStyle(
            fontSize: 30,
            color: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: SizedBox.expand(
        child: Stack(
          children: [
            // Camera preview
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: CameraPreview(cameraController!),
            ),

            // Foreground image with opacity
            Opacity(
              opacity: _opacity,
              child: Center(
                child: Image.asset(
                  "assets/draw.jpg",
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),

            // Slider at the bottom
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Slider(
                value: _opacity,
                min: 0.0,
                max: 1.0,
                divisions: 100,
                label: _opacity.toStringAsFixed(2),
                onChanged: (value) {
                  setState(() {
                    _opacity = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _setupCameraController() async {
    // ignore: no_leading_underscores_for_local_identifiers
    List<CameraDescription> _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      setState(() {
        cameras = _cameras;
        cameraController = CameraController(
          _cameras.first,
          ResolutionPreset.high,
        );
      });
      cameraController?.initialize().then((_) {
        setState(() {});
      });
    }
  }
}
