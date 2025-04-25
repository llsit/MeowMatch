import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Image.asset('assets/images/cat_icon.png'),
              ),

              Text(
                'แมวแบบไหนเหมาะกับคุณ? 🐾',
                textAlign: TextAlign.center,
                style: GoogleFonts.mPlusRounded1c(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF4A4A4A),
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'มาตอบคำถามง่าย ๆ แล้วมาดูกันว่า\nคุณเข้ากับแมวสายพันธุ์ไหนที่สุด!',
                textAlign: TextAlign.center,
                style: GoogleFonts.mPlusRounded1c(
                  fontSize: 16,
                  color: const Color(0xFF7A7A7A),
                ),
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5C8BF),
                  foregroundColor: Colors.white,
                  shadowColor: Colors.pink.shade100,
                  elevation: 5,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/quiz');
                },
                child: Text(
                  'เริ่มเลย!',
                  style: GoogleFonts.mPlusRounded1c(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
