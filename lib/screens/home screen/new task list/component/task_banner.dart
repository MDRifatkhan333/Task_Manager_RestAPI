
import '../../../../const/export.dart';

class TaskBanner extends StatelessWidget {
  const TaskBanner({
    super.key,
    required this.count,
    required this.taskName,
  });

  final String count;
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadlineText(text: count.length>10? '0$count':count),
        CommonText(
          text: taskName,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
