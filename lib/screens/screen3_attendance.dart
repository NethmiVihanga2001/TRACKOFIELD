import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/brand_header.dart';
import '../widgets/bullet_item.dart';

class Screen3Attendance extends StatefulWidget {
  const Screen3Attendance({super.key});

  @override
  State<Screen3Attendance> createState() => _Screen3AttendanceState();
}

class _Screen3AttendanceState extends State<Screen3Attendance> {
  String _leaveStatus = 'pending'; // 'pending', 'approved', 'rejected'

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo Header
          const TrackoFieldLogo(scale: 0.95),
          const SizedBox(height: 20),

          // Orange Section Title
          Text(
            'Attendance and Leave\nTracking',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFFEA580C),
              height: 1.25,
            ),
          ),
          const SizedBox(height: 12),

          // Description text
          Text(
            'Streamline the process for your employees to clock in and out through the app. Also, enabling seamless leave application and approval from anywhere, at any time.',
            style: GoogleFonts.inter(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4B5563),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 18),

          // Bullet Points
          const BulletPoint(text: 'Geo-coded Attendance Mark in/out'),
          const BulletPoint(text: 'Flexible Leave Management Module'),
          const BulletPoint(text: 'Real-time insights into staff absenteeism'),
          const SizedBox(height: 20),

          // Map & Leave Request Mockup Card
          Container(
            height: 310,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F8FB),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Map Vector Canvas
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _AttendanceMapPainter(),
                    ),
                  ),

                  // Street Names on Map
                  Positioned(
                    top: 14,
                    left: 28,
                    child: Text(
                      'Electrix',
                      style: GoogleFonts.inter(fontSize: 8, color: Colors.grey.shade500),
                    ),
                  ),
                  Positioned(
                    top: 26,
                    left: 45,
                    child: Text(
                      'Milestones Early\nLearning Granville',
                      style: GoogleFonts.inter(fontSize: 7.5, color: Colors.grey.shade500),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 95,
                    child: Text(
                      'Regent St',
                      style: GoogleFonts.inter(fontSize: 7.5, color: Colors.grey.shade500),
                    ),
                  ),
                  Positioned(
                    top: 85,
                    left: 145,
                    child: Text(
                      'Steindl St',
                      style: GoogleFonts.inter(fontSize: 7.5, color: Colors.grey.shade500),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 110,
                    child: Text(
                      'Granville Sports C',
                      style: GoogleFonts.inter(fontSize: 7.5, color: Colors.grey.shade500),
                    ),
                  ),
                  Positioned(
                    bottom: 22,
                    left: 65,
                    child: Text(
                      'Public Toilet',
                      style: GoogleFonts.inter(fontSize: 7.5, color: Colors.grey.shade500),
                    ),
                  ),

                  // Pin with Rida + Callout Tag
                  Positioned(
                    left: 42,
                    bottom: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Rida Avatar with Green dot
                        Stack(
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                                boxShadow: const [
                                  BoxShadow(color: Colors.black26, blurRadius: 4),
                                ],
                                color: const Color(0xFFFCE7F3),
                              ),
                              child: const Center(
                                child: Icon(Icons.person, color: Color(0xFFDB2777), size: 22),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF10B981),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 1.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Attached Green Callout Pill
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF10B981).withOpacity(0.35),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Rida Logged In',
                                style: GoogleFonts.inter(
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '09:30 AM',
                                style: GoogleFonts.inter(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Floating Card: Leave Request (Right)
                  Positioned(
                    right: 12,
                    top: 28,
                    bottom: 28,
                    width: 175,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.09),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Leave Request',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 9,
                                backgroundColor: Color(0xFFFBCFE8),
                                child: Icon(Icons.person, size: 10, color: Color(0xFFBE185D)),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Rida Applied for a leave Today.',
                                  style: GoogleFonts.inter(
                                    fontSize: 8,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Approve / Reject Buttons (Interactive!)
                          if (_leaveStatus == 'approved')
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFDCFCE7),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  '✓ Leave Approved',
                                  style: GoogleFonts.inter(
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF166534),
                                  ),
                                ),
                              ),
                            )
                          else if (_leaveStatus == 'rejected')
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFEE2E2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  '✕ Leave Rejected',
                                  style: GoogleFonts.inter(
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF991B1B),
                                  ),
                                ),
                              ),
                            )
                          else
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 24,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() => _leaveStatus = 'approved');
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Leave Approved for Rida'),
                                            backgroundColor: Color(0xFF10B981),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF22C55E),
                                        foregroundColor: Colors.white,
                                        padding: EdgeInsets.zero,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Text(
                                        'Approve',
                                        style: GoogleFonts.inter(
                                          fontSize: 9.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: SizedBox(
                                    height: 24,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() => _leaveStatus = 'rejected');
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Leave Rejected for Rida'),
                                            backgroundColor: Color(0xFFEF4444),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF6B7280),
                                        foregroundColor: Colors.white,
                                        padding: EdgeInsets.zero,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Text(
                                        'Reject',
                                        style: GoogleFonts.inter(
                                          fontSize: 9.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          const SizedBox(height: 10),

                          // Duration Details
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '3 Days',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF2563EB),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'March 01 - March 03 2024',
                                  style: GoogleFonts.inter(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: const LinearProgressIndicator(
                                    value: 0.65,
                                    minHeight: 3,
                                    backgroundColor: Color(0xFFE2E8F0),
                                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2563EB)),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  '12 Leaves Remaining',
                                  style: GoogleFonts.inter(
                                    fontSize: 7.5,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),

                          // Reason
                          Text(
                            'Reason',
                            style: GoogleFonts.inter(fontSize: 7.5, color: Colors.grey.shade500),
                          ),
                          Text(
                            'Going on a Vacation.',
                            style: GoogleFonts.inter(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1F2937),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),

          // Bottom Preview: Payroll and Salary Computation
          Text(
            'Payroll and Salary Computation',
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF3B5998), // Indigo/blue
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _AttendanceMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. Map roads
    final roadPaint = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..strokeWidth = 3.2
      ..style = PaintingStyle.stroke;

    final minorRoad = Paint()
      ..color = const Color(0xFFEEF2F6)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(0, size.height * 0.25), Offset(size.width, size.height * 0.8), roadPaint);
    canvas.drawLine(Offset(size.width * 0.6, 0), Offset(size.width * 0.1, size.height), roadPaint);
    canvas.drawLine(Offset(0, size.height * 0.65), Offset(size.width * 0.45, size.height * 0.45), minorRoad);
    canvas.drawLine(Offset(size.width * 0.45, size.height * 0.45), Offset(size.width, size.height * 0.2), minorRoad);

    // 2. Polygonal Geofence (Cyan/Blue boundary)
    final polyFill = Paint()
      ..color = const Color(0xFF0284C7).withOpacity(0.09)
      ..style = PaintingStyle.fill;

    final polyStroke = Paint()
      ..color = const Color(0xFF0284C7).withOpacity(0.8)
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke;

    final polyPath = Path()
      ..moveTo(size.width * 0.26, size.height * 0.22)
      ..lineTo(size.width * 0.38, size.height * 0.38)
      ..lineTo(size.width * 0.28, size.height * 0.58)
      ..lineTo(size.width * 0.16, size.height * 0.48)
      ..close();

    canvas.drawPath(polyPath, polyFill);
    canvas.drawPath(polyPath, polyStroke);

    // Waypoint pin inside geofence
    final pinCenter = Offset(size.width * 0.26, size.height * 0.24);
    final pinPaint = Paint()..color = const Color(0xFF0284C7);
    canvas.drawCircle(pinCenter, 6, pinPaint);
    canvas.drawCircle(pinCenter, 2.5, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
