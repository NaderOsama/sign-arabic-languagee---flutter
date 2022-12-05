import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:signarabiclanguagee/main.dart';
import 'package:tflite/tflite.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({Key key}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraImage cameraImage;
  CameraController cameraController;
  String output = '';
  bool isDetecting = false;

  Future<dynamic> delayed() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadmodel();
  }

  loadCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }setState(() {
          cameraController.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });

    });
  }

  runModel() async {
    if (!isDetecting) {
      isDetecting = true;
      delayed();
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage.height,
          imageWidth: cameraImage.width,
          imageMean: 127.5,
          imageStd: 127.5,
          numResults: 1,
          threshold: 0.4,
          asynch: true);
      for (var element in predictions) {
        setState(() {
          output = element['label'];
        });

        isDetecting = false;
      }
    }
  }

  Future loadmodel() async {
    Tflite.close();
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/label.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Center(child: Icon(Icons.camera_alt)),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 37),
          title: const Center(
            child: Text('لغة الاشارة'),
          ),
          backgroundColor: Colors.deepPurple),
      backgroundColor: const Color.fromRGBO(0, 36, 62, 1),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: !cameraController.value.isInitialized
                ? Container()
                : AspectRatio(
                    aspectRatio: cameraController.value.aspectRatio,
                    child: CameraPreview(cameraController),
                  ),
          ),
        ),
        Text(
          output,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
        )
      ]),
    );
  }
}
