
import '../../../const/export.dart';

class CancelledTaskList extends StatefulWidget {
  const CancelledTaskList({super.key});

  @override
  State<CancelledTaskList> createState() => _CancelledTaskListState();
}

class _CancelledTaskListState extends State<CancelledTaskList> {
  final String taskStatus = 'Canceled';

  @override
  void initState() {
    screenRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isLoading
        ? const LoadingScreen()
        : RefreshIndicator(
            onRefresh: () async {
              removeAllToNavigate(
                  context: context, route: RouteName.homeScreen, argument: 2);
            },
            child: SizedBox(
              height: size.height / 1.2,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: canceledTaskList.length,
                itemBuilder: (context, index) => TaskCard(
                  title: '${canceledTaskList[index].title}',
                  subtitle: '${canceledTaskList[index].description}',
                  btnText: '${canceledTaskList[index].status}',
                  date: '${canceledTaskList[index].createdDate}',
                  editPress: () {
                    showCustomBottomSheet(
                        taskStatus: taskStatus,
                        context: context,
                        list: canceledTaskList[index].sId);
                  },
                  deletePress: () {
                    showDeleteDialog(context, () {
                      deleteTask(context,
                          taskId: canceledTaskList[index].sId, arguments: 2);
                    });
                  },
                  btnColor: AppColor.kRedColor,
                ),
              ),
            ),
          );
  }

  screenRefresh() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }
}
