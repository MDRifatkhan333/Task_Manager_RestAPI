
import '../../const/export.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset({
    super.key, required this.img,
  });
  final String img;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
