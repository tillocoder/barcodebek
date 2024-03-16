import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellerPage extends StatefulWidget {
  const SellerPage({Key? key}) : super(key: key);

  @override
  State<SellerPage> createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  List<Uint8List> images = [];
  MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedImages = prefs.getStringList('images');
    if (savedImages != null) {
      setState(() {
        images = savedImages.map((String base64String) {
          return Uint8List.fromList(base64.decode(base64String));
        }).toList();
      });
    }
  }

  Future<void> _saveImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> base64Images = images.map((Uint8List image) {
      return base64.encode(image);
    }).toList();
    prefs.setStringList('images', base64Images);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner')),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: MobileScanner(
              controller: MobileScannerController(
                returnImage: true,
              ),
              onDetect: (capture) {
                setState(() {});
                cameraController.detectionSpeed;
                final List<Barcode> barcodes = capture.barcodes;
                final Uint8List? capturedImage = capture.image;
                for (final barcode in barcodes) {
                  debugPrint('Barcode found! ${barcode.rawValue}');
                }
                setState(() {
                  images.add(capturedImage!);
                  _saveImages();
                });
              },
            ),
          ),
          const SizedBox(height: 29),
          if (images.isNotEmpty) _buildImageGrid(),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.memory(
                    images[index],
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        images.removeAt(index);
                        _saveImages();
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Add your code to add images here
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Text(
                    "Barcode: ${_detectBarcode(images[index])}",
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _detectBarcode(Uint8List image) {
    // Add your barcode detection logic here
    // For now, returning a placeholder value
    return "Barcode Detected";
  }
}
