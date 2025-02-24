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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xFFEDF0FF),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06,
          vertical: screenHeight * 0.03,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                color: const Color(0xFF505050),
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Opacity(
              opacity: 0.68,
              child: Image.asset(_getImage(), width: screenWidth * 0.4, height: screenWidth * 0.4),
            ),
            SizedBox(height: screenHeight * 0.04),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7A6FB5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                ),
                onPressed: onTap,
                child: Text(
                  buttonTitle,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage example
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
