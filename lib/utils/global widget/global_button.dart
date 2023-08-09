import '../../const/export.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.onPress,
  });

  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPress,
        child: const Icon(
          Icons.arrow_circle_right_outlined,
        ),
      ),
    );
  }
}
