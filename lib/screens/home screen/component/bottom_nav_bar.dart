import '../../../const/export.dart';

BottomNavigationBar buildBottomNavigationBar({onTap, index, items}) {
  return BottomNavigationBar(
    selectedFontSize: kTextSize.sp,
    selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedItemColor: AppColor.kTextColor,
    selectedItemColor: AppColor.kPrimaryColor,
    backgroundColor: AppColor.kTextColor,
    currentIndex: index,
    elevation: 0,
    onTap: onTap,
    items: items,
  );
}
