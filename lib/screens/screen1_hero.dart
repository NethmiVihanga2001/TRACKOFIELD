import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/brand_header.dart';

class Screen1Hero extends StatelessWidget {
  const Screen1Hero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Header Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: const [
                TrackoFieldLogo(scale: 0.95),
              ],
            ),
          ),

          // Deep Blue Hero Section
          Container(
            color: const Color(0xFF16399A),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Field Employee Tracking\nSoftware',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.25,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Bring your end-to-end field operations under one umbrella with the help of Field Employee Management Software.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.92),
                      height: 1.45,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Mockup Display: Web Dashboard + Mobile Phone Overlay
                const _HeroMockupDisplay(),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Partnered with Industry Leaders Section
          Text(
            'Partnered with Industry Leaders',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 18),

          // Partner Logos Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _PartnerLogoCard(
                  name: 'Swara\nFincorp',
                  type: _PartnerType.swara,
                ),
                _PartnerLogoCard(
                  name: 'Sugam',
                  type: _PartnerType.sugam,
                ),
                _PartnerLogoCard(
                  name: 'SOUDAL',
                  type: _PartnerType.soudal,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _HeroMockupDisplay extends StatelessWidget {
  const _HeroMockupDisplay();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Desktop Window Frame
          Positioned(
            left: 0,
            right: 48,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    // Window Title Bar
                    Container(
                      height: 20,
                      color: const Color(0xFF1E2538),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Color(0xFF64748B),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '—  □  ✕',
                            style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Window Content
                    Expanded(
                      child: Row(
                        children: [
                          // Left Mini Rail
                          Container(
                            width: 20,
                            color: const Color(0xFF111728),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.apps, color: Colors.white60, size: 10),
                                Icon(Icons.people, color: Colors.white60, size: 10),
                                Icon(Icons.map, color: Colors.white60, size: 10),
                                Icon(Icons.task, color: Colors.white60, size: 10),
                                Icon(Icons.bar_chart, color: Colors.white60, size: 10),
                                Icon(Icons.settings, color: Colors.white60, size: 10),
                              ],
                            ),
                          ),
                          // Main View area with Map & Cards
                          Expanded(
                            child: Container(
                              color: const Color(0xFFF3F6FB),
                              child: Stack(
                                children: [
                                  // Roads & Map Canvas
                                  Positioned.fill(
                                    child: CustomPaint(
                                      painter: _DesktopMapPainter(),
                                    ),
                                  ),
                                  // Top Stats Bar
                                  Positioned(
                                    top: 4,
                                    left: 4,
                                    right: 4,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        boxShadow: const [
                                          BoxShadow(color: Colors.black12, blurRadius: 4),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 6,
                                            backgroundColor: Color(0xFF1D4ED8),
                                            child: Icon(Icons.person, size: 7, color: Colors.white),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Albert Ramirez',
                                            style: GoogleFonts.inter(
                                              fontSize: 7.5,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF1F2937),
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '10 Tasks • 49.5km',
                                            style: GoogleFonts.inter(fontSize: 6.5, color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Floating Info Card for Albert Ramirez
                                  Positioned(
                                    bottom: 6,
                                    left: 6,
                                    right: 12,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: const [
                                          BoxShadow(color: Colors.black12, blurRadius: 4),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              const CircleAvatar(
                                                radius: 5,
                                                backgroundColor: Color(0xFF10B981),
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                'Albert Ramirez (Attendance In: 09:30 AM)',
                                                style: GoogleFonts.inter(
                                                  fontSize: 6.5,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'Current Task: Meeting with Star Labs CEO',
                                            style: GoogleFonts.inter(fontSize: 6, color: Colors.black54),
                                          ),
                                          const SizedBox(height: 2),
                                          Row(
                                            children: [
                                              Text(
                                                'Pending: 0 | Completed: 3',
                                                style: GoogleFonts.inter(fontSize: 5.5, color: Colors.black87),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF2563EB),
                                                  borderRadius: BorderRadius.circular(3),
                                                ),
                                                child: Text(
                                                  '+ Add Task',
                                                  style: GoogleFonts.inter(fontSize: 5.5, color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Overlapping Smartphone Mockup on the right
          Positioned(
            right: 0,
            top: 15,
            bottom: 5,
            width: 105,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF111827), width: 2.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 16,
                    offset: const Offset(4, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Column(
                  children: [
                    // Dynamic Island / Phone Notch
                    Container(
                      height: 12,
                      color: Colors.white,
                      child: Center(
                        child: Container(
                          width: 28,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    // Phone App Bar: "My Dashboard"
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      color: Colors.white,
                      child: Row(
                        children: [
                          const Icon(Icons.menu, size: 8, color: Colors.black87),
                          const SizedBox(width: 3),
                          Text(
                            'My Dashboard',
                            style: GoogleFonts.inter(
                              fontSize: 6.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.search, size: 8, color: Colors.black54),
                        ],
                      ),
                    ),
                    // 4 Mini Stat Pills (Cyan, Coral, Purple, Teal)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _phonePill(const Color(0xFF06B6D4)),
                          _phonePill(const Color(0xFFF97316)),
                          _phonePill(const Color(0xFF8B5CF6)),
                          _phonePill(const Color(0xFF10B981)),
                        ],
                      ),
                    ),
                    // User Card 1: Anjali Sharma
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            _phoneUserCard(
                              name: 'Anjali Sharma',
                              role: 'Sales Executive',
                              avatarColor: const Color(0xFFF59E0B),
                            ),
                            const SizedBox(height: 4),
                            _phoneUserCard(
                              name: 'Rahul Kumar',
                              role: 'Field Officer',
                              avatarColor: const Color(0xFF3B82F6),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _phonePill(Color c) {
    return Container(
      width: 20,
      height: 9,
      decoration: BoxDecoration(
        color: c.withOpacity(0.85),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  static Widget _phoneUserCard({
    required String name,
    required String role,
    required Color avatarColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(3.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 4.5,
                backgroundColor: avatarColor,
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Text(
                  name,
                  style: GoogleFonts.inter(fontSize: 5.5, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          Text(role, style: GoogleFonts.inter(fontSize: 4.5, color: Colors.grey.shade600)),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Status: Active', style: GoogleFonts.inter(fontSize: 4.5, color: Colors.green.shade700)),
              const Icon(Icons.navigation, size: 5, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}

class _DesktopMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final boundaryPaint = Paint()
      ..color = const Color(0xFFEF4444).withOpacity(0.18)
      ..style = PaintingStyle.fill;

    final boundaryStroke = Paint()
      ..color = const Color(0xFFEF4444).withOpacity(0.6)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    // Draw some road grids
    canvas.drawLine(Offset(0, size.height * 0.35), Offset(size.width, size.height * 0.45), roadPaint);
    canvas.drawLine(Offset(size.width * 0.45, 0), Offset(size.width * 0.4, size.height), roadPaint);
    canvas.drawLine(Offset(size.width * 0.1, size.height * 0.8), Offset(size.width * 0.9, size.height * 0.2), roadPaint);

    // Red Geofence polygon
    final poly = Path()
      ..moveTo(size.width * 0.48, size.height * 0.35)
      ..lineTo(size.width * 0.65, size.height * 0.38)
      ..lineTo(size.width * 0.72, size.height * 0.65)
      ..lineTo(size.width * 0.52, size.height * 0.7)
      ..close();
    canvas.drawPath(poly, boundaryPaint);
    canvas.drawPath(poly, boundaryStroke);

    // Green route
    final routePaint = Paint()
      ..color = const Color(0xFF10B981)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    final routePath = Path()
      ..moveTo(size.width * 0.2, size.height * 0.6)
      ..lineTo(size.width * 0.35, size.height * 0.45)
      ..lineTo(size.width * 0.58, size.height * 0.52);
    canvas.drawPath(routePath, routePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

enum _PartnerType { swara, sugam, soudal }

class _PartnerLogoCard extends StatelessWidget {
  final String name;
  final _PartnerType type;

  const _PartnerLogoCard({
    required this.name,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    switch (type) {
      case _PartnerType.swara:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: Color(0xFF00A86B),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.bolt, color: Colors.white, size: 10),
            ),
            const SizedBox(width: 4),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Swara',
                  style: GoogleFonts.outfit(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1E3A8A),
                    height: 1.0,
                  ),
                ),
                Text(
                  'Fincorp',
                  style: GoogleFonts.outfit(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF00A86B),
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ],
        );
      case _PartnerType.sugam:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.navigation, color: Color(0xFFEA580C), size: 13),
            const SizedBox(width: 3),
            RichText(
              text: TextSpan(
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF1E3A8A),
                ),
                children: const [
                  TextSpan(text: 'Sugam\n'),
                  TextSpan(
                    text: 'GROUP',
                    style: TextStyle(
                      fontSize: 6.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFEA580C),
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case _PartnerType.soudal:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: const Color(0xFFDC2626),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            'SOUDAL',
            style: GoogleFonts.outfit(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        );
    }
  }
}
