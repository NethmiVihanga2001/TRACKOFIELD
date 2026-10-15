import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/brand_header.dart';
import '../widgets/bullet_item.dart';

class Screen2TaskAllocation extends StatefulWidget {
  const Screen2TaskAllocation({super.key});

  @override
  State<Screen2TaskAllocation> createState() => _Screen2TaskAllocationState();
}

class _Screen2TaskAllocationState extends State<Screen2TaskAllocation> {
  int _selectedTimelineIndex = 2; // Default is the highlighted 3rd item

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
          const SizedBox(height: 18),

          // Intro Paragraph
          Text(
            'Allocate tasks to field staff based on their proximity to the task site, matching skill sets and availability with the field employee management app.',
            style: GoogleFonts.inter(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4B5563),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 18),

          // Bullet Points
          const BulletPoint(text: 'Geo-verified task allocation'),
          const BulletPoint(text: 'Task completion timeline and reports'),
          const BulletPoint(text: 'Automated workflow management'),
          const SizedBox(height: 20),

          // Map & Timeline Showcase Card
          Container(
            height: 290,
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
                  // Background Map with Roads & Waypoints
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _TaskAllocationMapPainter(),
                    ),
                  ),

                  // Street Names labels
                  Positioned(
                    top: 18,
                    left: 90,
                    child: Text(
                      'North\nSyracuse',
                      style: GoogleFonts.inter(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    left: 105,
                    child: Text(
                      'Lyncourt',
                      style: GoogleFonts.inter(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    right: 20,
                    child: Text(
                      'Wildlife\nManagement\nArea',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.inter(
                        fontSize: 7.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),

                  // Timeline Floating Card (Right)
                  Positioned(
                    right: 12,
                    top: 24,
                    bottom: 24,
                    width: 175,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Date Pill Header
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Text(
                                '22-02-2024',
                                style: GoogleFonts.inter(
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Step 1: Attendance Mark IN
                          _timelineItem(
                            index: 0,
                            icon: Icons.radar,
                            iconColor: const Color(0xFF10B981),
                            title: 'Attendance Mark IN',
                            time: '22 FEB 2024, 09:15 AM',
                            titleColor: const Color(0xFF10B981),
                          ),

                          // Step 2: Task Completed
                          _timelineItem(
                            index: 1,
                            icon: Icons.check,
                            iconColor: Colors.grey.shade600,
                            title: 'Task Completed',
                            time: '22 FEB 2024, 10:37 PM',
                            titleColor: const Color(0xFF1F2937),
                          ),

                          // Step 3: Highlighted Active Box (index 2)
                          _timelineItem(
                            index: 2,
                            icon: Icons.check,
                            iconColor: Colors.white,
                            title: 'Task Completed',
                            time: '22 FEB 2024, 10:37 PM',
                            titleColor: Colors.white,
                          ),

                          // Step 4: Attendance Mark Out
                          _timelineItem(
                            index: 3,
                            icon: Icons.logout,
                            iconColor: const Color(0xFFEF4444),
                            title: 'Attendance Mark Out',
                            time: '22 FEB 2024, 06:15 PM',
                            titleColor: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Floating Card: Selena Green (Lower Left)
                  Positioned(
                    left: 12,
                    bottom: 18,
                    width: 155,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: const Color(0xFF10B981), width: 1.8),
                                  color: Colors.teal.shade100,
                                ),
                                child: const Center(
                                  child: Icon(Icons.person, color: Color(0xFF0F766E), size: 18),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Selena Green',
                                      style: GoogleFonts.inter(
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF1F2937),
                                      ),
                                    ),
                                    Text(
                                      'Field Marketing Executive',
                                      style: GoogleFonts.inter(
                                        fontSize: 7.5,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Expanded(
                                child: _actionPill(
                                  icon: Icons.phone,
                                  label: 'CALL',
                                  color: const Color(0xFF0284C7),
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Calling Selena Green...'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: _actionPill(
                                  icon: Icons.location_on,
                                  label: 'LOCATION',
                                  color: const Color(0xFF7C3AED),
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Tracking Selena Green Live Location...'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  },
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
          const SizedBox(height: 28),

          // Bottom Preview for Attendance and Leave Tracking
          Text(
            'Attendance and Leave\nTracking',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFFEA580C), // Warm orange
              height: 1.25,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Streamline the process for your employees to clock in and out through the app. Also, enabling seamless leave application and approval from anywhere, at any time.',
            style: GoogleFonts.inter(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4B5563),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }

  Widget _timelineItem({
    required int index,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String time,
    required Color titleColor,
  }) {
    if (_selectedTimelineIndex == index) {
      return InkWell(
        onTap: () => setState(() => _selectedTimelineIndex = index),
        child: _highlightedActiveBox(
          title: title,
          time: time,
        ),
      );
    }
    return InkWell(
      onTap: () => setState(() => _selectedTimelineIndex = index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 12, color: iconColor),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 8.5,
                      fontWeight: FontWeight.w600,
                      color: titleColor,
                    ),
                  ),
                  Text(
                    time,
                    style: GoogleFonts.inter(
                      fontSize: 7.5,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _highlightedActiveBox({
    required String title,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF1D4ED8),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1D4ED8).withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, size: 10, color: Color(0xFF1D4ED8)),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 8.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  time,
                  style: GoogleFonts.inter(
                    fontSize: 7,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionPill({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 9, color: color),
            const SizedBox(width: 3),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 7,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskAllocationMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. Street road lines
    final roadPaint = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke;

    final minorRoad = Paint()
      ..color = const Color(0xFFEEF2F6)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(0, size.height * 0.45), Offset(size.width, size.height * 0.42), roadPaint);
    canvas.drawLine(Offset(size.width * 0.35, 0), Offset(size.width * 0.32, size.height), roadPaint);
    canvas.drawLine(Offset(size.width * 0.15, size.height * 0.8), Offset(size.width * 0.7, 0), minorRoad);
    canvas.drawLine(Offset(0, size.height * 0.2), Offset(size.width * 0.5, size.height * 0.7), minorRoad);

    // 2. Purple Circular Geofence
    final geofenceCenter = Offset(size.width * 0.23, size.height * 0.43);
    final geofenceRadius = size.width * 0.15;

    final geofenceFill = Paint()
      ..color = const Color(0xFF7C3AED).withOpacity(0.12)
      ..style = PaintingStyle.fill;
    final geofenceStroke = Paint()
      ..color = const Color(0xFF7C3AED).withOpacity(0.7)
      ..strokeWidth = 1.6
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(geofenceCenter, geofenceRadius, geofenceFill);
    canvas.drawCircle(geofenceCenter, geofenceRadius, geofenceStroke);

    // Starting green dot
    final dotPaint = Paint()..color = const Color(0xFF10B981);
    canvas.drawCircle(geofenceCenter, 4, dotPaint);

    // 3. Teal-Green GPS Tracked Route Line
    final routePaint = Paint()
      ..color = const Color(0xFF00BFA5)
      ..strokeWidth = 3.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final route = Path()
      ..moveTo(geofenceCenter.dx, geofenceCenter.dy)
      ..lineTo(size.width * 0.35, size.height * 0.43)
      ..lineTo(size.width * 0.46, size.height * 0.43);
    canvas.drawPath(route, routePaint);

    // Green waypoint marker with direction arrow
    final waypointCenter = Offset(size.width * 0.46, size.height * 0.43);
    canvas.drawCircle(waypointCenter, 9, Paint()..color = const Color(0xFF10B981));
    canvas.drawCircle(waypointCenter, 7, Paint()..color = const Color(0xFF00BFA5));

    final arrowPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final arrow = Path()
      ..moveTo(waypointCenter.dx - 2, waypointCenter.dy - 3)
      ..lineTo(waypointCenter.dx + 2, waypointCenter.dy)
      ..lineTo(waypointCenter.dx - 2, waypointCenter.dy + 3);
    canvas.drawPath(arrow, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
