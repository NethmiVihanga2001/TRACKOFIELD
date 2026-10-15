import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/brand_header.dart';
import '../widgets/bullet_item.dart';

class Screen5Expenses extends StatefulWidget {
  const Screen5Expenses({super.key});

  @override
  State<Screen5Expenses> createState() => _Screen5ExpensesState();
}

class _Screen5ExpensesState extends State<Screen5Expenses> {
  // Patrick's claim status: 'pending', 'approved', 'rejected'
  String _patrickStatus = 'pending';

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

          // Orange Title
          Text(
            'Employee Expense\nManagement',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFFEA580C),
              height: 1.25,
            ),
          ),
          const SizedBox(height: 12),

          // Intro Paragraph
          Text(
            'Managing overheads, reimbursements and remunerations is part of field staff management. TrackoField simplifies it all with an in-app expense management tool.',
            style: GoogleFonts.inter(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4B5563),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 18),

          // Bullet Points
          const BulletPoint(text: 'Request or revert to expense claims on-the-go'),
          const BulletPoint(text: 'Attach bills or receipts as expense proof'),
          const BulletPoint(text: 'Maintain a record online for future reference'),
          const SizedBox(height: 20),

          // Expense Claims List Container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Claim 1: Patrick (Travel Expense - Interactive)
                _buildExpenseItem(
                  avatarColor: const Color(0xFF1E3A8A),
                  avatarIcon: Icons.person,
                  avatarBg: const Color(0xFFE2E8F0),
                  employeeName: 'Patrrick',
                  expenseCategory: 'Travel Expense',
                  categoryColor: const Color(0xFF1D4ED8),
                  amount: '\$10.80',
                  billDetails: 'Uber Ride: Client HQ to Metro Terminal (Invoice #TRV-894)',
                  rightAction: _buildPatrickAction(),
                ),
                const SizedBox(height: 12),

                // Claim 2: Steward (Stationery Expense - Approved)
                _buildExpenseItem(
                  avatarColor: const Color(0xFFC2410C),
                  avatarIcon: Icons.person,
                  avatarBg: const Color(0xFFFFEDD5),
                  employeeName: 'Steward',
                  expenseCategory: 'Stationery Expense',
                  categoryColor: const Color(0xFF9333EA),
                  amount: '\$3',
                  billDetails: 'Office Supplies: Notepad & Ballpoint Pens (Receipt #STN-201)',
                  rightAction: _buildStatusBadge(
                    label: '• Approved',
                    bg: const Color(0xFFDCFCE7),
                    text: const Color(0xFF166534),
                  ),
                ),
                const SizedBox(height: 12),

                // Claim 3: John (Food Expense - Rejected)
                _buildExpenseItem(
                  avatarColor: const Color(0xFF047857),
                  avatarIcon: Icons.person,
                  avatarBg: const Color(0xFFD1FAE5),
                  employeeName: 'John',
                  expenseCategory: 'Food Expense',
                  categoryColor: const Color(0xFF10B981),
                  amount: '\$7',
                  billDetails: 'Field Lunch: Subway Deli Combo (Receipt #FD-4092)',
                  rightAction: _buildStatusBadge(
                    label: '• Rejected',
                    bg: const Color(0xFFFEE2E2),
                    text: const Color(0xFF991B1B),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // Bottom Preview: Order Management Tool
          Text(
            'Order Management Tool',
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1D4ED8), // Blue
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildExpenseItem({
    required Color avatarColor,
    required IconData avatarIcon,
    required Color avatarBg,
    required String employeeName,
    required String expenseCategory,
    required Color categoryColor,
    required String amount,
    required String billDetails,
    required Widget rightAction,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Circular Avatar
          CircleAvatar(
            radius: 20,
            backgroundColor: avatarBg,
            child: Icon(avatarIcon, color: avatarColor, size: 24),
          ),
          const SizedBox(width: 10),

          // Details Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2937),
                    ),
                    children: [
                      TextSpan(text: '$employeeName Added a '),
                      TextSpan(
                        text: expenseCategory,
                        style: TextStyle(
                          color: categoryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      amount,
                      style: GoogleFonts.inter(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w800,
                        color: categoryColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => _showBillDialog(employeeName, expenseCategory, amount, billDetails),
                      child: Text(
                        'view bill',
                        style: GoogleFonts.inter(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2563EB),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Right Action / Status Badge
          rightAction,
        ],
      ),
    );
  }

  Widget _buildPatrickAction() {
    if (_patrickStatus == 'approved') {
      return _buildStatusBadge(
        label: '• Approved',
        bg: const Color(0xFFDCFCE7),
        text: const Color(0xFF166534),
      );
    }
    if (_patrickStatus == 'rejected') {
      return _buildStatusBadge(
        label: '• Rejected',
        bg: const Color(0xFFFEE2E2),
        text: const Color(0xFF991B1B),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Red Reject Box [X]
        InkWell(
          onTap: () {
            setState(() => _patrickStatus = 'rejected');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Patrick\'s Travel Expense claim rejected'),
                backgroundColor: Color(0xFFEF4444),
                duration: Duration(seconds: 1),
              ),
            );
          },
          borderRadius: BorderRadius.circular(6),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFFEE2E2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.close, color: Color(0xFFEF4444), size: 18),
          ),
        ),
        const SizedBox(width: 8),
        // Green Approve Box [✓]
        InkWell(
          onTap: () {
            setState(() => _patrickStatus = 'approved');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Patrick\'s Travel Expense (\$10.80) approved!'),
                backgroundColor: Color(0xFF10B981),
                duration: Duration(seconds: 1),
              ),
            );
          },
          borderRadius: BorderRadius.circular(6),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFDCFCE7),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.check, color: Color(0xFF10B981), size: 18),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge({
    required String label,
    required Color bg,
    required Color text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 10.5,
          fontWeight: FontWeight.w700,
          color: text,
        ),
      ),
    );
  }

  void _showBillDialog(String employee, String category, String amount, String details) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.receipt_long, color: Color(0xFF1D4ED8)),
            const SizedBox(width: 8),
            Text(
              'Expense Bill Proof',
              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Submitted by: $employee', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text('Category: $category', style: GoogleFonts.inter(color: Colors.grey.shade700)),
            const SizedBox(height: 4),
            Text('Claimed Amount: $amount', style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold, color: const Color(0xFF1D4ED8))),
            const Divider(height: 20),
            Text('Receipt Description:', style: GoogleFonts.inter(fontSize: 11, color: Colors.grey)),
            Text(details, style: GoogleFonts.inter(fontSize: 13)),
            const SizedBox(height: 12),
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.attachment, color: Colors.grey),
                    SizedBox(width: 6),
                    Text('Verified Digital Receipt.pdf', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
