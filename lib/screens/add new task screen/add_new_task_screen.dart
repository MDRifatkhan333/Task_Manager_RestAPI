
import '../../const/export.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  createNewTask(context) async {
    EasyLoading.show(status: 'Loading..');
    var response = await createNewTaskApiRequest(
        description: descriptionController.text.trim(),
        title: subjectController.text.trim(),
        taskStatus: 'New');
    if (response == true) {
      EasyLoading.showToast('Task Added success',
          toastPosition: EasyLoadingToastPosition.bottom);
      removeAllToNavigate(context: context, route: RouteName.homeScreen);
    } else {
      EasyLoading.showError('Task Add failed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: PhotosCard(
              onTap: () {
                Navigator.of(context).pushNamed(RouteName.updateProfileScreen);
              },
              img: UserData.userPhoto.isEmpty
                  ? decodeBase64Image(base64String)
                  : decodeBase64Image(UserData.userPhoto)),
          title: Column(  crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
        body: BackgroundView(
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height / 1.8,
              width: size.width / 1.2,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HeadlineText(text: Strings.addNewTask),
                    SizedBox(height: kPrimarySmallSize.sp),
                    CustomTextField(

                        textInputAction: TextInputAction.next,
                        validator: validate,
                        keyboardType: TextInputType.text,
                        controller: subjectController,
                        hintText: Strings.enterYourSubject,
                        label: Strings.subject),
                    const SizedBox(height: 10),
                    CustomTextField(
                      focusNode: focusNode,
                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          focusNode.unfocus();
                          createNewTask(context);
                        }
                      },
                      keyboardType: TextInputType.text,
                      validator: validate,
                      textInputAction: TextInputAction.done,
                      controller: descriptionController,
                      hintText: Strings.enterYourDescription,
                      label: Strings.description,
                      padding: 25,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 10),
                    GlobalButton(
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          focusNode.unfocus();
                          createNewTask(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
