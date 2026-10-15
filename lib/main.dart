import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_theme.dart';
import 'widgets/sticky_bottom_bar.dart';
import 'screens/screen1_hero.dart';
import 'screens/screen2_task_allocation.dart';
import 'screens/screen3_attendance.dart';
import 'screens/screen4_payroll.dart';
import 'screens/screen5_expenses.dart';
import 'screens/screen6_voice_notes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TrackoFieldApp());
}

class TrackoFieldApp extends StatelessWidget {
  const TrackoFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrackoField Mobile App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const MainAppShell(),
    );
  }
}

class MainAppShell extends StatefulWidget {
  const MainAppShell({super.key});

  @override
  State<MainAppShell> createState() => _MainAppShellState();
}

class _MainAppShellState extends State<MainAppShell> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  int _activeTabIndex = 0;
  bool _isSingleScreenView = false;
  late TabController _tabController;

  final List<String> _sectionTitles = [
    'All Sections',
    '1. Hero Overview',
    '2. Task Allocation',
    '3. Attendance & Leave',
    '4. Payroll',
    '5. Expense Claims',
    '6. Voice Notes',
  ];

  final List<GlobalKey> _sectionKeys = List.generate(6, (index) => GlobalKey());

  final List<String> _screenshotAssetPaths = [
    'assets/images/screen1_hero.jpg',
    'assets/images/screen2_tasks.jpg',
    'assets/images/screen3_attendance.jpg',
    'assets/images/screen4_payroll.jpg',
    'assets/images/screen5_expenses.jpg',
    'assets/images/screen6_voice.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    setState(() => _activeTabIndex = index);

    if (_isSingleScreenView) {
      if (index > 0) {
        _tabController.animateTo(index - 1);
      }
      return;
    }

    if (index == 0) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      return;
    }

    final key = _sectionKeys[index - 1];
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _openComparisonSheet(int index) {
    final screenshotIdx = index.clamp(0, 5);
    final assetPath = _screenshotAssetPaths[screenshotIdx];
    final title = _sectionTitles[screenshotIdx + 1];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.compare, color: Color(0xFF1D4ED8)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Original Reference: $title',
                      style: GoogleFonts.inter(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF111827),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(ctx),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        'Image asset: $assetPath',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(88),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Mini Top Navigation Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                  child: Row(
                    children: [
                      // Toggle View Mode (Continuous vs Tabbed)
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isSingleScreenView = !_isSingleScreenView;
                          });
                        },
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _isSingleScreenView
                                ? const Color(0xFFEFF6FF)
                                : const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: _isSingleScreenView
                                  ? const Color(0xFF2563EB)
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _isSingleScreenView ? Icons.view_carousel : Icons.view_stream,
                                size: 14,
                                color: _isSingleScreenView
                                    ? const Color(0xFF2563EB)
                                    : const Color(0xFF4B5563),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                _isSingleScreenView ? 'Single Screen' : 'Continuous Flow',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: _isSingleScreenView
                                      ? const Color(0xFF2563EB)
                                      : const Color(0xFF4B5563),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Compare with Original Button
                      InkWell(
                        onTap: () {
                          final currentIdx = _isSingleScreenView
                              ? _tabController.index
                              : (_activeTabIndex > 0 ? _activeTabIndex - 1 : 0);
                          _openComparisonSheet(currentIdx);
                        },
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xFFF59E0B)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.image_outlined, size: 14, color: Color(0xFFB45309)),
                              const SizedBox(width: 4),
                              Text(
                                'Compare Original',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFB45309),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Horizontal Section Chips
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: _sectionTitles.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 6),
                    itemBuilder: (context, index) {
                      final isSelected = _activeTabIndex == index;
                      return Center(
                        child: InkWell(
                          onTap: () => _scrollToSection(index),
                          borderRadius: BorderRadius.circular(16),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.brandBlue
                                  : const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              _sectionTitles[index],
                              style: GoogleFonts.inter(
                                fontSize: 11.5,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                color: isSelected ? Colors.white : const Color(0xFF4B5563),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _isSingleScreenView ? _buildSingleScreenView() : _buildContinuousView(),
      bottomNavigationBar: const StickyBottomBar(),
    );
  }

  Widget _buildContinuousView() {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Screen 1: Hero & Partners
          Container(
            key: _sectionKeys[0],
            child: const Screen1Hero(),
          ),

          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),

          // Screen 2: Task Allocation & Route
          Container(
            key: _sectionKeys[1],
            child: const Screen2TaskAllocation(),
          ),

          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),

          // Screen 3: Attendance & Leave Tracking
          Container(
            key: _sectionKeys[2],
            child: const Screen3Attendance(),
          ),

          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),

          // Screen 4: Payroll and Salary Computation
          Container(
            key: _sectionKeys[3],
            child: const Screen4Payroll(),
          ),

          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),

          // Screen 5: Employee Expense Management
          Container(
            key: _sectionKeys[4],
            child: const Screen5Expenses(),
          ),

          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),

          // Screen 6: Voice Note Sharing & CTA
          Container(
            key: _sectionKeys[5],
            child: const Screen6VoiceNotes(),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSingleScreenView() {
    return TabBarView(
      controller: _tabController,
      physics: const BouncingScrollPhysics(),
      children: const [
        SingleChildScrollView(child: Screen1Hero()),
        SingleChildScrollView(child: Screen2TaskAllocation()),
        SingleChildScrollView(child: Screen3Attendance()),
        SingleChildScrollView(child: Screen4Payroll()),
        SingleChildScrollView(child: Screen5Expenses()),
        SingleChildScrollView(child: Screen6VoiceNotes()),
      ],
    );
  }
}
