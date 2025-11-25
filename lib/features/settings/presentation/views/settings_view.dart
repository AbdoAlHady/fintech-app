part of '../../feature_imports.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SettingsViewBody().withPadding(horizontal: 16, vertical: 20),
    );
  }
}
