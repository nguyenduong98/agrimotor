part of 'widgets.dart';

class NoNetworkAlertWidget extends StatelessWidget {
  const NoNetworkAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.all(20.sp),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Text(
        'Không có kết nối internet',
        style: SharedTextTheme.regular14,
        textAlign: TextAlign.center,
      ),
    );
  }
}
