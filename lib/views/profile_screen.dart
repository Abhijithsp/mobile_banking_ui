import 'package:banking_ui/utils/constants/assets.dart';
import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:banking_ui/utils/constants/json/shortcut_list.dart';
import 'package:banking_ui/widgets/shortcut_button.dart';
import 'package:banking_ui/widgets/staggered_fade_slide.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_rounded, color: Styles.primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          // Avatar & User Info
          StaggeredFadeSlide(
            delayMs: 100,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Styles.greenColor, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        Assets.dash,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Abhijith S P",
                    style: GoogleFonts.outfit(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Styles.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "abhijith@apexbank.com",
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Styles.greenColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "PREMIUM MEMBER",
                      style: GoogleFonts.outfit(
                        color: Styles.greenColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),

          // Shortcut button bar
          StaggeredFadeSlide(
            delayMs: 200,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Styles.whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: profilesShortcutList.map<Widget>((item) {
                  return ShortcutButton(
                    icon: item['icon'],
                    label: item['label'],
                    color: item['color'],
                    onTap: () {},
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 28),

          // Settings Options
          StaggeredFadeSlide(
            delayMs: 300,
            child: Text(
              "Account Settings",
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Styles.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 12),
          
          StaggeredFadeSlide(
            delayMs: 400,
            slideOffset: 15.0,
            child: _buildSettingsTile(
              icon: Icons.shield_outlined,
              title: "Security & Biometrics",
              subtitle: "Face ID, PINs & Security settings",
            ),
          ),
          StaggeredFadeSlide(
            delayMs: 500,
            slideOffset: 15.0,
            child: _buildSettingsTile(
              icon: Icons.notifications_none_outlined,
              title: "Notifications",
              subtitle: "Manage transactional alerts",
            ),
          ),
          StaggeredFadeSlide(
            delayMs: 600,
            slideOffset: 15.0,
            child: _buildSettingsTile(
              icon: Icons.help_outline_rounded,
              title: "Help & Support",
              subtitle: "FAQs, Chat support & Contact info",
            ),
          ),
          StaggeredFadeSlide(
            delayMs: 700,
            slideOffset: 15.0,
            child: _buildSettingsTile(
              icon: Icons.info_outline_rounded,
              title: "About",
              subtitle: "Terms of service, app version & policies",
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Styles.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Styles.greenColor.withValues(alpha: 0.08),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Styles.greenColor, size: 22),
        ),
        title: Text(
          title,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Styles.primaryColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.outfit(
            color: Colors.grey.shade500,
            fontSize: 12,
          ),
        ),
        trailing: Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400),
        onTap: () {},
      ),
    );
  }
}
