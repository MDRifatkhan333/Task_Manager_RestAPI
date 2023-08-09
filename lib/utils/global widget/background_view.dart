import '../../const/export.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: SvgPicture.asset(
            primaryBackground,
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(child: Center(child: child))
      ],
    );
  }
}
