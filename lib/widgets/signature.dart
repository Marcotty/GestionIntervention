import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'dart:ui' as ui;

class SignatureWidget extends StatefulWidget {
  final Function(ui.Image)? onSignatureValidated;
  const SignatureWidget({Key? key, this.onSignatureValidated}) : super(key: key);

  @override
  State<SignatureWidget> createState() => _SignatureWidgetState();
}

class _SignatureWidgetState extends State<SignatureWidget> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  ui.Image? _signatureImage;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Client Signature', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 16),
            GestureDetector(
              onHorizontalDragUpdate: (_) {}, // Block horizontal drag
              child: Container(
                width: screenWidth * 0.95,
                height: screenHeight * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Signature(
                  controller: _controller,
                  height: screenHeight * 0.6,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => _controller.clear(),
                      child: Text('Effacer'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final image = await _controller.toImage();
                        setState(() {
                          _signatureImage = image;
                        });
                        if (widget.onSignatureValidated != null && image != null) {
                          widget.onSignatureValidated!(image);
                        }
                      },
                      child: Text('Valider'),
                    ),
                  ),
                ),
              ],
            ),
            if (_signatureImage != null)
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: BoxConstraints(maxHeight: 180),
                  child: RawImage(image: _signatureImage, height: 150),
                ),
              ),
          ],
        ),
      ),
    );
  }
}