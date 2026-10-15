import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/brand_header.dart';
import '../widgets/bullet_item.dart';

class Screen4Payroll extends StatelessWidget {
  const Screen4Payroll({super.key});

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
            'Enjoy automated salary computation and transparent reimbursement processing as per working hours, leaves and expenses updated on the field employee tracking app.',
            style: GoogleFonts.inter(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4B5563),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 18),

          // Bullet Points
          const BulletPoint(text: 'Add custom allowances and debits'),
          const BulletPoint(text: 'Auto linking to leaves and expenses'),
          const BulletPoint(text: 'Generate salary slips in a single click'),
          const SizedBox(height: 20),

          // Payroll Showcase Container (Cards Mockup)
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                // Left Card: Monthly Payroll Chart + Joseph's Payout
                Expanded(
                  flex: 6,
                  child: _PayrollChartCard(),
                ),
                SizedBox(width: 8),
                // Right Card: Employee Payout List
                Expanded(
                  flex: 5,
                  child: _PayrollEmployeeListCard(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // Bottom Preview: Employee Expense Management
          Text(
            'Employee Expense\nManagement',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFFEA580C), // Orange
              height: 1.25,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _PayrollChartCard extends StatelessWidget {
  const _PayrollChartCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Amount & Avatars
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This Month Payroll',
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '\$365,892',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF111827),
                      ),
                    ),
                  ],
                ),
              ),
              // Avatar Stack + +254 People
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 48,
                    height: 18,
                    child: Stack(
                      children: [
                        _miniAvatar(0, const Color(0xFFF59E0B)),
                        _miniAvatar(12, const Color(0xFF3B82F6)),
                        _miniAvatar(24, const Color(0xFF10B981)),
                        _miniAvatar(36, const Color(0xFFEC4899)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '+254 People',
                    style: GoogleFonts.inter(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Floating Oct Total Payroll Tag
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Oct Total Payroll',
                    style: GoogleFonts.inter(
                      fontSize: 7.5,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF2563EB),
                    ),
                  ),
                  Text(
                    '\$160756',
                    style: GoogleFonts.inter(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1D4ED8),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),

          // Line Chart Area
          SizedBox(
            height: 68,
            child: CustomPaint(
              size: const Size(double.infinity, 68),
              painter: _PayrollLineChartPainter(),
            ),
          ),
          const SizedBox(height: 4),

          // Months Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                .map(
                  (m) => Text(
                    m,
                    style: GoogleFonts.inter(
                      fontSize: 7.5,
                      fontWeight: m == 'Oct' ? FontWeight.bold : FontWeight.w500,
                      color: m == 'Oct' ? const Color(0xFF2563EB) : Colors.grey.shade500,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 10),

          // Joseph's December Payout Card
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 11,
                  backgroundColor: Color(0xFF1E293B),
                  child: Icon(Icons.person, size: 12, color: Colors.white),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Joseph's December Payout",
                        style: GoogleFonts.inter(
                          fontSize: 7.5,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        '\$1500',
                        style: GoogleFonts.inter(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF111827),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '• PAID',
                    style: GoogleFonts.inter(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF16A34A),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _miniAvatar(double left, Color color) {
    return Positioned(
      left: left,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.2),
        ),
      ),
    );
  }
}

class _PayrollEmployeeListCard extends StatelessWidget {
  const _PayrollEmployeeListCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _EmployeeSalaryItem(
            name: 'Bassie Cooper',
            role: 'Sales Manager',
            salary: '\$3650',
            avatarBg: Color(0xFFFEF08A),
            avatarColor: Color(0xFFCA8A04),
            isApproved: true,
          ),
          Divider(height: 14, thickness: 0.5),
          _EmployeeSalaryItem(
            name: 'Floyed Miles',
            role: 'Field Executive',
            salary: '\$6598',
            avatarBg: Color(0xFFCCFBF1),
            avatarColor: Color(0xFF0F766E),
            isApproved: false,
          ),
          Divider(height: 14, thickness: 0.5),
          _EmployeeSalaryItem(
            name: 'Ralph Edward',
            role: 'Production Manager',
            salary: '\$1245',
            avatarBg: Color(0xFFE0E7FF),
            avatarColor: Color(0xFF4338CA),
            isApproved: true,
          ),
        ],
      ),
    );
  }
}

class _EmployeeSalaryItem extends StatelessWidget {
  final String name;
  final String role;
  final String salary;
  final Color avatarBg;
  final Color avatarColor;
  final bool isApproved;

  const _EmployeeSalaryItem({
    required this.name,
    required this.role,
    required this.salary,
    required this.avatarBg,
    required this.avatarColor,
    required this.isApproved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 9,
              backgroundColor: avatarBg,
              child: Icon(Icons.person, size: 10, color: avatarColor),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      fontSize: 8.5,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F2937),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    role,
                    style: GoogleFonts.inter(
                      fontSize: 6.8,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                salary,
                style: GoogleFonts.inter(
                  fontSize: 8.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Icon(
              isApproved ? Icons.check_circle : Icons.cancel,
              size: 13,
              color: isApproved ? const Color(0xFF10B981) : const Color(0xFFEF4444),
            ),
          ],
        ),
      ],
    );
  }
}

class _PayrollLineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Grid baseline
    final gridPaint = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(0, h * 0.85), Offset(w, h * 0.85), gridPaint);

    // Points: Jun, Jul, Aug, Sep, Oct, Nov, Dec
    final points = [
      Offset(w * 0.05, h * 0.75),
      Offset(w * 0.20, h * 0.65),
      Offset(w * 0.35, h * 0.68),
      Offset(w * 0.50, h * 0.55),
      Offset(w * 0.65, h * 0.22), // Peak at Oct
      Offset(w * 0.82, h * 0.45),
      Offset(w * 0.95, h * 0.50),
    ];

    // Smooth path
    final path = Path()..moveTo(points[0].dx, points[0].dy);
    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];
      final controlX = (p0.dx + p1.dx) / 2;
      path.cubicTo(controlX, p0.dy, controlX, p1.dy, p1.dx, p1.dy);
    }

    // Gradient Fill
    final fillPath = Path.from(path)
      ..lineTo(points.last.dx, h * 0.85)
      ..lineTo(points.first.dx, h * 0.85)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF3B82F6).withOpacity(0.3),
          const Color(0xFF3B82F6).withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, w, h))
      ..style = PaintingStyle.fill;
    canvas.drawPath(fillPath, fillPaint);

    // Stroke
    final strokePaint = Paint()
      ..color = const Color(0xFF2563EB)
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, strokePaint);

    // Oct Highlight Dot
    final octPoint = points[4];
    final dotOuter = Paint()..color = const Color(0xFF2563EB);
    final dotInner = Paint()..color = Colors.white;
    canvas.drawCircle(octPoint, 4, dotOuter);
    canvas.drawCircle(octPoint, 2, dotInner);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
