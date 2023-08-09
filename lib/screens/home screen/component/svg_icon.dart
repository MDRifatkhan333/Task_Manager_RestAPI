import '../../../const/export.dart';

class SvgIcn extends StatelessWidget {
  const SvgIcn({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: 30,
      width: 30,
    );
  }
}
