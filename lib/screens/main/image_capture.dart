import 'dart:io';
import 'dart:convert';
import 'package:doctor/screens/main/report_result.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:doctor/constants.dart';

class ImageCapture extends StatefulWidget {
  final String title;

  const ImageCapture({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  var imageUploadEndPoint = Uri.http(bloodApiServer, "/imageUpload");
  XFile? _pickedFile;
  CroppedFile? _croppedFile;
  String path = "";
  final ImagePicker _picker = ImagePicker();
  int status = 0;
  var blood;

  _startUpload() {
    setState(() {
      status = 1;
    });
    File file = File(path);
    String base64Image = base64Encode(file.readAsBytesSync());
    String fileName = '${DateTime.now()}.png';
    http.post(imageUploadEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      if (res.statusCode == 200) {
        setState(() {
          status = 2;
        });
        print(res.body);
        blood = jsonDecode(res.body);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ReportResult(report: blood),
          ),
        );
      } else {
        setState(() {
          status = 3;
        });
      }
    }).catchError((err) {
      print(err);
      setState(() {
        status = 3;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb ? AppBar(title: Text(widget.title)) : null,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (kIsWeb)
            Padding(
              padding: const EdgeInsets.all(kIsWeb ? 24.0 : 16.0),
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Theme.of(context).highlightColor),
              ),
            ),
          Expanded(child: _body()),
        ],
      ),
    );
  }

  Widget _body() {
    if (_croppedFile != null || _pickedFile != null) {
      return _imageCard();
    } else {
      return _uploaderCard();
    }
  }

  Widget _imageCard() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kIsWeb ? 24.0 : 16.0),
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(kIsWeb ? 24.0 : 16.0),
                child: _image(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          _menu(),
          const SizedBox(height: 24.0),
          if (status == 0)
            ElevatedButton.icon(
              onPressed: _startUpload,
              icon: Icon(
                Icons.cloud_upload,
                size: 24.0,
              ),
              label: const Text('上传至云平台'),
            )
          else if (status == 1)
            ElevatedButton.icon(
              onPressed: _startUpload,
              icon: Icon(
                Icons.cloud_upload,
                size: 24.0,
              ),
              label: const Text('正在上传...'),
            )
          else if (status == 3)
            ElevatedButton.icon(
              onPressed: _startUpload,
              icon: Icon(
                Icons.cloud_upload,
                size: 24.0,
              ),
              label: const Text('上传失败！请重试。'),
            ),
        ],
      ),
    );
  }

  Widget _image() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (_croppedFile != null) {
      path = _croppedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else if (_pickedFile != null) {
      path = _pickedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _menu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            _clear();
            status = 0;
          },
          backgroundColor: Colors.redAccent,
          tooltip: '删除',
          child: const Icon(Icons.delete),
        ),
        if (_croppedFile == null)
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: FloatingActionButton(
              onPressed: () {
                _cropImage();
              },
              backgroundColor: const Color(0xFFBC764A),
              tooltip: '裁剪',
              child: const Icon(Icons.crop),
            ),
          )
      ],
    );
  }

  Widget _uploaderCard() {
    return Center(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SizedBox(
          width: kIsWeb ? 380.0 : 320.0,
          height: 360.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DottedBorder(
                    radius: const Radius.circular(12.0),
                    borderType: BorderType.RRect,
                    dashPattern: const [8, 4],
                    color: Theme.of(context).highlightColor.withOpacity(0.4),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: Theme.of(context).highlightColor,
                            size: 80.0,
                          ),
                          const SizedBox(height: 32.0),
                          Text(
                            '上传图片',
                            style: kIsWeb
                                ? Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: Theme.of(context).highlightColor)
                                : Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color:
                                            Theme.of(context).highlightColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Column(children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      _uploadImage(ImageSource.camera);
                    },
                    icon: Icon(
                      Icons.photo_camera,
                      size: 24.0,
                    ),
                    label: const Text('拍照'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _uploadImage(ImageSource.gallery);
                    },
                    icon: Icon(
                      Icons.photo_library,
                      size: 24.0,
                    ),
                    label: const Text('相册'),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '裁剪',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: '裁剪',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
                const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
          path = croppedFile.path;
          status = 0;
        });
      }
    }
  }

  Future<void> _uploadImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
        path = pickedFile.path;
        status = 0;
      });
    }
  }

  void _clear() {
    setState(() {
      _pickedFile = null;
      _croppedFile = null;
      status = -1;
    });
  }
}
