import '../const/export.dart';
//Log out method
logOutUser({item, context}) async {
  if (item == 'logout') {
    await removeSharedPrefData(setTokenKey);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteName.loginScreen, (route) => false);
  }
}
//Navigate screen
removeAllToNavigate({context, route, argument}) {
  Navigator.of(context).pushNamedAndRemoveUntil(route,arguments: argument, (route) => false);
}
//Pick image method
Future  pickImage(imageSource) async {
  ImagePicker picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: imageSource);
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
}
//Show dialog
void showDeleteDialog(BuildContext context, onDelete) {
  // Create a dialog with a title, content message, and two buttons.
  AlertDialog alertDialog = AlertDialog(
    title: const Text('Delete'),
    content: const Text('Are you sure you want to delete this?'),
    actions: [
      OutlinedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColor.kRedColor),
          ),
          onPressed: onDelete,
          child: const Icon(
            Icons.delete,
            color: AppColor.kWhiteColor,
          )),
      OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
  // Show the dialog.
  showDialog(context: context, builder: (context) => alertDialog);
}
//Delete Task
Future deleteTask(context, {taskId, arguments}) async {
  EasyLoading.show(status: 'Deleting');
  var response = await deleteTaskApiRequest(taskId: taskId);
  if (response == true) {
    EasyLoading.showSuccess('Successfully deleted');
    removeAllToNavigate(context: context,route: RouteName.homeScreen,argument: arguments);
  } else {
    EasyLoading.showError('Failed!');
  }
}
//ShowBottomSheet
void showCustomBottomSheet({context, taskStatus, list}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) =>
            Padding(
              padding: const EdgeInsets.all(kDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadlineText(
                    text: 'Select Task Status:',
                  ),
                  const SizedBox(height: 16),
                  RadioListTile(
                    activeColor: AppColor.kPrimaryColor,
                    title: const SubtitleText(text: 'New'),
                    value: 'New',
                    groupValue: taskStatus,
                    onChanged: (value) {
                      setState(() {
                        taskStatus = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const SubtitleText(text: 'Completed'),
                    value: 'Completed',
                    groupValue: taskStatus,
                    onChanged: (value) {
                      setState(() {
                        taskStatus = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const SubtitleText(text: 'Canceled'),
                    value: 'Canceled',
                    groupValue: taskStatus,
                    onChanged: (value) {
                      setState(() {
                        taskStatus = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const SubtitleText(text: 'Progress'),
                    value: 'Progress',
                    groupValue: taskStatus,
                    onChanged: (value) {
                      setState(() {
                        taskStatus = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  GlobalButton(onPress: () async {
                    EasyLoading.show(status: 'Sending');
                    var response = await updateTaskStatusApiRequest(
                        taskStatus: taskStatus, sId: list);
                    if (response == true) {
                      EasyLoading.showSuccess('Sent to : $taskStatus');
                      removeAllToNavigate(context: context,route: RouteName.homeScreen);
                    } else {
                      EasyLoading.showError('Failed!');
                    }
                  }),
                ],
              ),
            ),
      );
    },
  );
}