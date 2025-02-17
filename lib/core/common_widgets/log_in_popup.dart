import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPopup extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onLogin;

  const LoginPopup({super.key, required this.onCancel, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600; // Mobile breakpoint

          return SingleChildScrollView(
            child: Container(
              width: isMobile ? constraints.maxWidth * 0.95 : constraints.maxWidth * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: BoxDecoration(
                color: const Color(0xFFEDF0FF),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isMobile
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildImage(),
                      const SizedBox(height: 16),
                      _buildText(),
                      const SizedBox(height: 20),
                      _buildButtons(isMobile),
                    ],
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildImage(),
                      const SizedBox(width: 40),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildText(),
                            const SizedBox(height: 30),
                            _buildButtons(isMobile),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: 180,
      height: 140,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login_pop_up_img.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      'To add a business, you need to be logged in. Please Sign-In to continue.',
      textAlign: TextAlign.center,
      style: GoogleFonts.nunito(
        color: const Color(0xFF505050),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildButtons(bool isMobile) {
    return isMobile
        ? Column(
      children: [
        _buildButton('Cancel', Colors.transparent, const Color(0xFF7A6FB5), true, onCancel),
        const SizedBox(height: 10),
        _buildButton('Log-In', const Color(0xFF7A6FB5), Colors.white, false, onLogin),
      ],
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildButton('Cancel', Colors.transparent, const Color(0xFF7A6FB5), true, onCancel),
        const SizedBox(width: 16),
        _buildButton('Log-In', const Color(0xFF7A6FB5), Colors.white, false, onLogin),
      ],
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, bool isOutlined, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 45,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: isOutlined ? Border.all(color: const Color(0xFF7A6FB5)) : null,
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 4,
              offset: Offset(2, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.nunito(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
