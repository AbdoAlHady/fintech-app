part of '../../feature_imports.dart';

class CardType extends StatelessWidget {
  const CardType({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primaryColor,
      ),
      child: Center(child: Image.asset(imageUrl)),
    );
  }
}
