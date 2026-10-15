import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/brand_header.dart';

class Screen6VoiceNotes extends StatefulWidget {
  const Screen6VoiceNotes({super.key});

  @override
  State<Screen6VoiceNotes> createState() => _Screen6VoiceNotesState();
}

class _Screen6VoiceNotesState extends State<Screen6VoiceNotes> with SingleTickerProviderStateMixin {
  bool _isPlaying = false;
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: const [
                TrackoFieldLogo(scale: 0.95),
              ],
            ),
          ),

          // Main Voice Note Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Voice Note Sharing',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Green Subtitle
                  Text(
                    'Simplifying Field Operations Even Further',
                    style: GoogleFonts.inter(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF16A34A),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Intro Paragraph
                  Text(
                    'Walk the talk, with the voice note sharing feature on our field tracking software. Save time and energy just by speaking and sending out the message.',
                    style: GoogleFonts.inter(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF4B5563),
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 22),

                  // Q&A Block 1: Voice to Text
                  _buildQAItem(
                    question: 'Do you find typing a task?',
                    coloredText: 'Voice to Text',
                    coloredTextColor: const Color(0xFFEF4444), // Coral / Salmon Red
                    trailingText: ' is for you!',
                  ),
                  const SizedBox(height: 18),

                  // Q&A Block 2: Voice Note
                  _buildQAItem(
                    question: 'Can’t explain complexities in writing?',
                    leadingText: 'Leave a ',
                    coloredText: 'Voice Note',
                    coloredTextColor: const Color(0xFF2563EB), // Blue
                    trailingText: ' in chats.',
                  ),
                  const SizedBox(height: 18),

                  // Q&A Block 3: Voice Recording
                  _buildQAItem(
                    question: 'Documents, images & PDFs aren’t enough?',
                    leadingText: 'Attach a ',
                    coloredText: 'Voice Recording',
                    coloredTextColor: const Color(0xFFEA580C), // Orange
                    trailingText: ' too. ‘',
                  ),

                  const SizedBox(height: 22),

                  // Interactive Voice Note Player Demonstration
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        // Play / Pause Circle Button
                        InkWell(
                          onTap: () {
                            setState(() => _isPlaying = !_isPlaying);
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1D4ED8),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Animated Waveform
                        Expanded(
                          child: AnimatedBuilder(
                            animation: _waveController,
                            builder: (context, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(18, (index) {
                                  final baseHeight = ((index * 7) % 18 + 8).toDouble();
                                  final animHeight = _isPlaying
                                      ? (baseHeight * (0.6 + 0.8 * ((_waveController.value + index * 0.1) % 1.0))).clamp(6.0, 24.0)
                                      : baseHeight;
                                  return Container(
                                    width: 3,
                                    height: animHeight,
                                    decoration: BoxDecoration(
                                      color: _isPlaying
                                          ? const Color(0xFF2563EB)
                                          : Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Duration
                        Text(
                          _isPlaying ? '0:14' : '0:28',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Deep Blue Bottom Card: "Navigate Smartly and Operate Smoothly In The Field"
          Container(
            color: const Color(0xFF143493),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Stack(
              children: [
                // Dot Grid Texture
                Positioned.fill(
                  child: CustomPaint(
                    painter: _DotGridPainter(),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Navigate Smartly and\nOperate Smoothly In The\nField',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Start with ZERO investment! Automate your\nfield operations for free. What are you waiting\nfor?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.9),
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQAItem({
    required String question,
    String leadingText = '',
    required String coloredText,
    required Color coloredTextColor,
    required String trailingText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Text(
            question,
            style: GoogleFonts.inter(
              fontSize: 13.5,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF374151),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Color(0xFF22C55E),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 13,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1F2937),
                  ),
                  children: [
                    if (leadingText.isNotEmpty) TextSpan(text: leadingText),
                    TextSpan(
                      text: coloredText,
                      style: TextStyle(color: coloredTextColor),
                    ),
                    TextSpan(text: trailingText),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..style = PaintingStyle.fill;

    const spacing = 16.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
