part of '../../feature_imports.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SvgPicture.asset(
          AppAssets.svgsCard,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.contain,
        ),
        Align(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '8629  8629  8629  1234',
                style: AppTextStyles.bold16.copyWith(color: AppColors.white),
              ),
              space(height: 10),
              Text(
                'Valid till',
                style: AppTextStyles.medium10.copyWith(color: AppColors.white),
              ),
              space(height: 3),
              Text(
                '09/24',
                style: AppTextStyles.bold10.copyWith(color: AppColors.white),
              ),
              space(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Abdo Al hady',
                    style: AppTextStyles.bold16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SvgPicture.asset(AppAssets.svgsMatserCard),
                ],
              ),
            ],
          ).withPadding(horizontal: 20, bottom: 25),
        ),
      ],
    );
  }
}
