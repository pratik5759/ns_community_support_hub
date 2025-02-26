import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Enum for dialog types
enum DialogType { success, error, warning }

class AppDialog extends StatelessWidget {
  final String message;
  final DialogType type;
  final String buttonTitle;
  final VoidCallback onTap;

  const AppDialog({
    Key? key,
    required this.message,
    required this.type,
    required this.buttonTitle,
    required this.onTap,
  }) : super(key: key);

  String _getImage() {
    switch (type) {
      case DialogType.success:
        return "assets/images/dialouge_success.gif";
      case DialogType.error:
        return "assets/images/dialouge_error.gif";
      case DialogType.warning:
        return "assets/images/dialouge_warning.gif";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xFFEDF0FF),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          double dialogWidth = isMobile ? constraints.maxWidth * 0.9 : constraints.maxWidth * 0.4;
          double imageSize = isMobile ? dialogWidth * 0.35 : dialogWidth * 0.25;

          return Container(
            width: dialogWidth,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // Message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      color: const Color(0xFF505050),
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Image
                SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: Image.asset(
                    _getImage(),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 24),


                // Button
                SizedBox(
                  width: isMobile ? dialogWidth * 0.6 : 160,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7A6FB5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: onTap,
                    child: Text(
                      buttonTitle,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Usage function to show dialog
void showAppDialog(BuildContext context, String message, DialogType type, String buttonTitle, VoidCallback onTap) {
  showDialog(
    context: context,
    builder: (context) => AppDialog(
      message: message,
      type: type,
      buttonTitle: buttonTitle,
      onTap: onTap,
    ),
  );
}
