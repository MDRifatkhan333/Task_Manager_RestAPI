import '../../const/export.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.date,
      required this.btnText,
      this.editPress,
      this.deletePress,
      this.btnColor});

  final String title;
  final String subtitle;
  final String date;
  final String btnText;
  final Function()? editPress;
  final Function()? deletePress;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(kSmallSize.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardTitle(text: title),
            SizedBox(height: kTooSmallSize.sp),
            SubtitleText(text: subtitle),
            SizedBox(height: kSmallSize.sp),
            CommonText(
              text: 'Date : $date',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: kSmallSize.sp),
            Row(
              children: [
                SizedBox(
                  height: 30,
                  child: MaterialButton(
                    splashColor: AppColor.kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kDefaultSize.sp)),
                    onPressed: () {},
                    color: btnColor,
                    child: Text(
                      btnText,
                      style: const TextStyle(
                          color: AppColor.kWhiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Spacer(),
                OutlinedButton(
                    onPressed: editPress,
                    child: const Icon(
                      Icons.edit_location_sharp,
                      color: AppColor.kPrimaryColor,
                    )),
                const SizedBox(width: 5),
                OutlinedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.kRedColor),
                    ),
                    onPressed: deletePress,
                    child: const Icon(
                      Icons.delete,
                      color: AppColor.kWhiteColor,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
