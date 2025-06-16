import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:wakelock_plus/wakelock_plus.dart';

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
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    _setupCameraController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    imagePath = args['path'];
    isAsset = args['isAsset'];

    if (!isAsset) {
      setState(() => isProcessing = true);
      removeBackground(imagePath).then((File? result) {
        if (result != null) {
          setState(() {
            imagePath = result.path;
          });
        }
        setState(() => isProcessing = false);
      });
    }
  }

  @override
  void dispose() {
    WakelockPlus.disable();
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

  Future<File?> removeBackground(String imagePath) async {
    const apiKey = 'BMTgGTDd4sC8CJNajeJSZvxk'; //Remove bg api key

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://api.remove.bg/v1.0/removebg'),
    );

    request.headers['X-Api-Key'] = apiKey;
    request.files.add(
      await http.MultipartFile.fromPath('image_file', imagePath),
    );
    request.fields['size'] = 'auto';

    final response = await request.send();

    if (response.statusCode == 200) {
      final bytes = await response.stream.toBytes();
      final dir = await getTemporaryDirectory();
      final file = File(
        p.join(dir.path, 'no_bg_${DateTime.now().millisecondsSinceEpoch}.png'),
      );
      await file.writeAsBytes(bytes);
      return file;
    } else {
      debugPrint('Remove.bg failed: ${response.statusCode}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Overlay Camera",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: cameraController == null || !cameraController!.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 1,
                  child: Center(child: CameraPreview(cameraController!)),
                ),

                // Overlay Image
                if (!isProcessing)
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

                if (isProcessing)
                  const Center(child: CircularProgressIndicator()),

                // Opacity slider
                if (!isProcessing)
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
      backgroundColor: Colors.black,
    );
  }
}
