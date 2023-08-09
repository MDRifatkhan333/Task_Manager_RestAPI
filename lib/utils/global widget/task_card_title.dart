import '../../const/export.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: titleMedium(
        color: AppColor.kTextColor,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 2,
    );
  }
}
