import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _isScanning = false;

  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _controller.start();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MobileScanner(
          controller: _controller,
          scanWindow: Rect.fromLTWH(
            MediaQuery.of(context).size.width * 0.1,
            MediaQuery.of(context).size.height * 0.3,
            MediaQuery.of(context).size.width * 0.8,
            MediaQuery.of(context).size.height * 0.4,
          ),
          onDetect: (barcode) {
            String code = barcode.barcodes.single.rawValue ?? "";
            if (!_isScanning) {
              _isScanning = true;
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Coins Detected"),
                    content: Text("Coins: $code"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _isScanning = false;
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
        QRScannerOverlay(
          borderColor: Colors.green,
          borderRadius: 16,
          overlayColor: Colors.black.withOpacity(0.5),
        )
      ],
    ));
  }
}
