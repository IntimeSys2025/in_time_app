import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/features/account/presentation/widgets/qr_fail_popup.dart';
import 'package:in_time_app/features/home/presentation/screens/navigation_screen.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
// import 'package:qr_flutter/qr_flutter.dart';

class ScanQRScreen extends StatefulWidget {
  const ScanQRScreen({super.key});

  @override
  _ScanQRScreenState createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  final TextEditingController _providerIdController =
      TextEditingController(text: "4567dd778");
  // MobileScannerController controller = MobileScannerController(
  //   detectionSpeed: DetectionSpeed.normal,
  //   facing: CameraFacing.back,
  //   torchEnabled: false,
  // );

  // Barcode? result;
  // QRViewController? controller;
  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   }
  //   controller!.resumeCamera();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: const Text(
          "Scan QR",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Scan the QR code OR Enter Provider ID",
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
                24.heightSpace,

                // Provider ID TextField
                TextField(
                  controller: _providerIdController,
                  decoration: InputDecoration(
                    hintText: "Enter Provider ID",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                  ),
                  onChanged: (value) => setState(() {
                    if(value.contains('123')){
                      showDialog(context: context, builder: (context) {
                        return const QrFailPopup();
                      },);
                    }

                  }), // Update QR live
                ),
                32.heightSpace,

                // QR Code Section
                const Center(
                  child: Text(
                    "OR Scan QR Code",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                16.heightSpace,
                Center(
                  child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: SizedBox()
                      // Stack(
                      //   children: [
                      //     // Full-screen scanner
                      //     MobileScanner(
                      //       controller: controller,
                      //       onDetect: (BarcodeCapture capture) {
                      //         final List<Barcode> barcodes = capture.barcodes;
                      //         for (final barcode in barcodes) {
                      //           final String? code = barcode.rawValue;
                      //           if (code != null && code.isNotEmpty) {
                      //             // Vibrate/haptic feedback (optional)
                      //             // HapticFeedback.mediumImpact();
                      //
                      //             // widget.onScan(code); // Send result back
                      //             Navigator.pop(context); // Close scanner
                      //             break;
                      //           }
                      //         }
                      //       },
                      //     ),
                      //
                      //     // Overlay with scanning frame
                      //     Center(
                      //       child: Container(
                      //         width: 250,
                      //         height: 250,
                      //         decoration: BoxDecoration(
                      //           border: Border.all(color: Colors.green, width: 4),
                      //           borderRadius: BorderRadius.circular(16),
                      //         ),
                      //       ),
                      //     ),
                      //
                      //     // Instructions
                      //     Align(
                      //       alignment: Alignment.bottomCenter,
                      //       child: Container(
                      //         margin: EdgeInsets.only(bottom: 50),
                      //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      //         decoration: BoxDecoration(
                      //           color: Colors.black54,
                      //           borderRadius: BorderRadius.circular(30),
                      //         ),
                      //         child: Text(
                      //           "Position the QR code inside the frame",
                      //           style: TextStyle(color: Colors.white, fontSize: 16),
                      //           textAlign: TextAlign.center,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // )










                      // _buildQrView(context)
                      // QrImageView(
                      //   data: _providerIdController.text.isEmpty
                      //       ? "4567dd778" // Fallback if empty
                      //       : _providerIdController.text,
                      //   version: QrVersions.auto,
                      //   size: 250,
                      //   gapless: false,
                      //   errorCorrectionLevel: QrErrorCorrectLevel.H,
                      // ),
                      ),
                ),
                // const Spacer(),

                // Submit Button
                // AppButtonWidget(
                //     title: 'Submit',
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const NavigationBarScreen(),
                //           ));
                //     }),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       final providerId = _providerIdController.text.trim();
                //       if (providerId.isNotEmpty) {
                //         print("Submitted Provider ID: $providerId");
                //         // TODO: Handle submission (API call, navigation, etc.)
                //         ScaffoldMessenger.of(context).showSnackBar(
                //           SnackBar(content: Text("Submitted: $providerId")),
                //         );
                //       }
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.green,
                //       foregroundColor: Colors.white,
                //       padding: EdgeInsets.symmetric(vertical: 18),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //     ),
                //     child: Text(
                //       "Submit",
                //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: AppButtonWidget(
              title: 'Submit',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationBarScreen(),
                    ));
              }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _providerIdController.dispose();
    super.dispose();
  }
  // Widget _buildQrView(BuildContext context) {
  //   // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
  //   var scanArea =
  //   (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 150.0 : 300.0;
  //   // To ensure the Scanner view is properly sizes after rotation
  //   // we need to listen for Flutter SizeChanged notification and update controller
  //   return QRView(
  //     key: qrKey,
  //     onQRViewCreated: _onQRViewCreated,
  //     overlay: QrScannerOverlayShape(
  //         borderColor: Colors.red, borderRadius: 10, borderLength: 30, borderWidth: 10, cutOutSize: scanArea),
  //     onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
  //   );
  // }
  // void _onQRViewCreated(QRViewController controller) {
  //   setState(() {
  //     this.controller = controller;
  //   });
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //     });
  //   });
  // }
  //
  // void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
  //   log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
  //   if (!p) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('no Permission')),
  //     );
  //   }
  // }
}
