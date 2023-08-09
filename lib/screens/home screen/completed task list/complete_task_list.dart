import '../../../const/export.dart';

class CompletedTaskList extends StatefulWidget {
  const CompletedTaskList({super.key});

  @override
  State<CompletedTaskList> createState() => _CompletedTaskListState();
}

class _CompletedTaskListState extends State<CompletedTaskList> {
  final String taskStatus = 'Completed';

  @override
  void initState() {
    screenRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isLoading
        ?  const LoadingScreen()
        : RefreshIndicator(
         onRefresh:()async{
           removeAllToNavigate(context: context,route: RouteName.homeScreen,argument: 1);
         },
          child: SizedBox(
              height: size.height / 1.2,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: completedTaskList.length,
                itemBuilder: (context, index) => TaskCard(
                  title: '${completedTaskList[index].title}',
                  subtitle: '${completedTaskList[index].description}',
                  btnText: '${completedTaskList[index].status}',
                  date: '${completedTaskList[index].createdDate}',
                  editPress: () {
                    showCustomBottomSheet(
                        taskStatus: taskStatus,
                        context: context,
                        list: completedTaskList[index].sId);
                  },
                  deletePress: () {
                    showDeleteDialog(context, () {
                      deleteTask(context,
                          taskId: completedTaskList[index].sId, arguments: 1);
                    });
                  },
                  btnColor: AppColor.kPrimaryColor,
                ),
              ),
            ),
        );
  }

  screenRefresh() {
    // ignore: prefer_const_constructors
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }
}
