import '../../../const/export.dart';

class NewTaskList extends StatefulWidget {
  const NewTaskList({super.key});

  @override
  State<NewTaskList> createState() => _NewTaskListState();
}

class _NewTaskListState extends State<NewTaskList> {
  final String taskStatus = 'New';

  @override
  void initState() {
    screenRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: isLoading
          ?  const LoadingScreen()
          : ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultSize),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TaskBanner(
                          count: '${newTaskList.length}', taskName: 'NewTask'),
                      TaskBanner(
                          count: '${completedTaskList.length}',
                          taskName: 'Completed'),
                      TaskBanner(
                          count: '${canceledTaskList.length}',
                          taskName: 'Canceled'),
                      TaskBanner(
                          count: '${progressTaskList.length}',
                          taskName: 'Progress'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RefreshIndicator(
                  onRefresh: ()async{
                    removeAllToNavigate(context: context,route: RouteName.homeScreen,argument: 0);
                  },
                  child: SizedBox(
                    height: size.height / 1.4,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: newTaskList.length,
                      itemBuilder: (context, index) => TaskCard(
                        title: '${newTaskList[index].title}',
                        subtitle: '${newTaskList[index].description}',
                        btnText: '${newTaskList[index].status}',
                        date: '${newTaskList[index].createdDate}',
                        editPress: () {
                          showCustomBottomSheet(
                              taskStatus: taskStatus,
                              context: context,
                              list: newTaskList[index].sId);
                        },
                        deletePress: () {
                          showDeleteDialog(context, () {
                            deleteTask(context,
                                taskId: newTaskList[index].sId, arguments: 0);
                          });
                        },
                        btnColor: AppColor.kBlueColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        clipBehavior: Clip.antiAlias,
        onPressed: () {
          Navigator.of(context).pushNamed(RouteName.addNewTaskScreen);
        },
        child: const Icon(Icons.add),
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
