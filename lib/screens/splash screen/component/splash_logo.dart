import '../../../const/export.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: SvgAsset(img: primaryLogo));
  }
}
