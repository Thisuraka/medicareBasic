import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Helper {
  static Future<List<XFile>> selectImages() async {
    final List<XFile>? _imageFileList = [];
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? _selectedImages =
        await _picker.pickMultiImage(imageQuality: 85);
    if (_selectedImages!.isNotEmpty) {
      _imageFileList!.addAll(_selectedImages);
      if (_imageFileList.length > 1) {
        int l = _imageFileList.length;
        _imageFileList.removeRange(2, l);
        // print("Sorry can't have more than 10");
      }
    }
    print("Image list length : " + _imageFileList!.length.toString());
    return _imageFileList;
  }

  static Future<List<XFile>> selectNewImages(int imageLimiter) async {
    int pick = 1 - imageLimiter;
    final List<XFile>? _imageFileList = [];
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? _selectedImages = await _picker.pickMultiImage();
    if (_selectedImages!.isNotEmpty) {
      _imageFileList!.addAll(_selectedImages);
      if (_imageFileList.length > pick) {
        int l = _imageFileList.length;
        _imageFileList.removeRange(pick, l);
        Fluttertoast.showToast(
          msg: "Can not have more than 1 image",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    }
    print("Image list length : " + _imageFileList!.length.toString());
    return _imageFileList;
  }
}

void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
