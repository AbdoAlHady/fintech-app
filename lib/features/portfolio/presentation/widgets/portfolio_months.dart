part of '../../feature_imports.dart';

class PortfolioMonths extends StatefulWidget {
  const PortfolioMonths({super.key});

  @override
  State<PortfolioMonths> createState() => _PortfolioMonthsState();
}

class _PortfolioMonthsState extends State<PortfolioMonths> {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              log('Selected Month: ${months[index]}');
              setState(() {
                selectedIndex = index;
              });
            },
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              width: 54,
              height: 35,
              child: Center(
                child: Text(
                  months[index],
                  style: selectedIndex == index
                      ? AppTextStyles.medium12.copyWith(
                          color: AppColors.lightPrimaryColor,
                        )
                      : AppTextStyles.regular12.copyWith(
                          color: AppColors.darkGrey,
                        ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => space(width: 5),
        itemCount: months.length,
      ),
    );
  }
}
