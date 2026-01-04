import 'package:flutter/material.dart';
import 'about_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: const Color(0xFF4A90FF),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
        
          _sectionTitle('Preferences'),
          _settingsCard(
            children: const [
              _SettingsItem(
                icon: Icons.dark_mode,
                title: 'Dark Mode',
                trailing: Switch(
                  value: false,
                  onChanged: null, 
                ),
              ),
              Divider(height: 1),
              _SettingsItem(
                icon: Icons.language,
                title: 'Language',
                trailing: Text('ENG'),
              ),
              Divider(height: 1),
              _SettingsItem(
                icon: Icons.notifications,
                title: 'Notifications',
                trailing: Switch(value: true, onChanged: null),
              ),
            ],
          ),

          const SizedBox(height: 24),

          _sectionTitle('Security'),
          _settingsCard(
            children: const [
              _SettingsItem(icon: Icons.lock, title: 'Change Password'),
              Divider(height: 1),
              _SettingsItem(
                icon: Icons.fingerprint,
                title: 'Biometric Authentication',
              ),
            ],
          ),

          const SizedBox(height: 24),

          _sectionTitle('App'),
          _settingsCard(
            children: [
              _SettingsItem(
                icon: Icons.info_outline,
                title: 'About',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutScreen()),
                  );
                },
              ),
              const Divider(height: 1),
              const _SettingsItem(
                icon: Icons.privacy_tip,
                title: 'Privacy Policy',
              ),
              const Divider(height: 1),
              const _SettingsItem(
                icon: Icons.info,
                title: 'App Version',
                trailing: Text('1.0.0'),
              ),
            ],
          ),

          const SizedBox(height: 24),

          _sectionTitle('Account'),
          _settingsCard(
            children: const [
              _SettingsItem(
                icon: Icons.logout,
                title: 'Logout',
                isDanger: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _settingsCard({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isDanger;

  const _SettingsItem({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: isDanger ? Colors.red : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: isDanger ? Colors.red : Colors.black,
          fontWeight: isDanger ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
