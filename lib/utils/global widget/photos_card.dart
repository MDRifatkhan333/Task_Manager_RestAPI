import '../../const/export.dart';

class PhotosCard extends StatelessWidget {
  const PhotosCard({
    super.key,
    required this.img,
    this.onTap,
  });

  final Uint8List? img;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
          child: CircleAvatar(
            radius: 30,
              backgroundColor: AppColor.kTransparentColor,
              backgroundImage: MemoryImage(img!))),
    );
  }
}
