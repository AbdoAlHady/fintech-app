part of '../../feature_imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody().withPadding(horizontal: 16, vertical: 21),
    );
  }
}
