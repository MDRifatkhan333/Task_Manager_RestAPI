import '../../const/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  dynamic pushedIndex;
  Future getData() async {
    String? tokenData = await getStringData(key: setTokenKey);
    String? emailData = await getStringData(key: setEmailKey);
    String? firstNameData = await getStringData(key: setFirstNameKey);
    String? lastNameData = await getStringData(key: setLastNameKey);
    String? mobileData = await getStringData(key: setMobileKey);
    String? photoData = await getStringData(key: setPhotoKey);
    String? passwordData = await getStringData(key: setPasswordKey);
    UserData.userToken = tokenData!;
    UserData.userEmail = emailData!;
    UserData.userFirstName = firstNameData!;
    UserData.userLastName = lastNameData!;
    UserData.userMobileNumber = mobileData!;
    UserData.userPhoto = photoData!;
    UserData.userPassword = passwordData!;
    setState(() {});
  }

  //Fetch task status data
  fetchData({list, status}) {
    setState(() {
      getTaskListStatusApiRequest(taskStatus: status).then((value) {
        for (var json in value) {
          list.add(TaskStatusDataModel.fromJson(json));
        }
      });
    });
  }

  refreshData() {
    setState(() {
      isLoading = true;
    });
    getData().then((value) {
      fetchData(list: newTaskList, status: 'New');
      fetchData(list: progressTaskList, status: 'Progress');
      fetchData(list: completedTaskList, status: 'Completed');
      fetchData(list: canceledTaskList, status: 'Canceled');
      setState(() {
        index = pushedIndex ?? 0;
      });
    });
  }

  @override
  void initState() {
    refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pushedIndex = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: PhotosCard(
            onTap: () {
              Navigator.of(context).pushNamed(RouteName.updateProfileScreen);
            },
            img: UserData.userPhoto.isEmpty
                ? decodeBase64Image(base64String)
                : decodeBase64Image(UserData.userPhoto)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: '${UserData.userFirstName} ${UserData.userLastName}',
              color: AppColor.kWhiteColor,
            ),
            SubtitleText(
              text: UserData.userEmail,
              color: AppColor.kWhiteColor.withOpacity(0.7),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteName.homeScreen, (route) => false);
              },
              icon: const Icon(Icons.refresh)),
          PopupMenuButton(
            onSelected: (item) async {
              logOutUser(item: item, context: context);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'logout',
                  child: Text('Log Out'),
                ),
                const PopupMenuItem(
                  value: 'settings',
                  child: Text('Settings'),
                ),
                const PopupMenuItem(
                  value: 'about',
                  child: Text('About'),
                ),
                // You can add more menu items here if needed.
              ];
            },
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
          index: index,
          items: items),
      body: screens[index],
    );
  }

  List<Widget> screens = [
    const NewTaskList(),
    const CompletedTaskList(),
    const CancelledTaskList(),
    const ProgressTaskList(),
  ];
}
