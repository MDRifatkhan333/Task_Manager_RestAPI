import '../../../const/export.dart';

class ProgressTaskList extends StatefulWidget {
  const ProgressTaskList({super.key});

  @override
  State<ProgressTaskList> createState() => _ProgressTaskListState();
}

class _ProgressTaskListState extends State<ProgressTaskList> {
  final String taskStatus = 'Progress';

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
                  context: context, route: RouteName.homeScreen, argument: 3);
            },
            child: SizedBox(
              height: size.height / 1.2,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: progressTaskList.length,
                itemBuilder: (context, index) => TaskCard(
                  title: '${progressTaskList[index].title}',
                  subtitle: '${progressTaskList[index].description}',
                  btnText: '${progressTaskList[index].status}',
                  date: '${progressTaskList[index].createdDate}',
                  editPress: () {
                    showCustomBottomSheet(
                        taskStatus: taskStatus,
                        context: context,
                        list: progressTaskList[index].sId);
                  },
                  deletePress: () {
                    showDeleteDialog(context, () {
                      deleteTask(context,
                          taskId: progressTaskList[index].sId, arguments: 3);
                    });
                  },
                  btnColor: AppColor.kPurpleColor,
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
