

import '../../const/export.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.blue, // Set the color of the loading spinner
          size: 50.0, // Set the size of the loading spinner
        ),
      ),
    );
  }
}