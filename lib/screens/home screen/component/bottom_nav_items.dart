import '../../../const/export.dart';

List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(
    label: 'New Task',
    icon: SvgIcn(image: newTaskSvg),
  ),
  const BottomNavigationBarItem(
    label: 'Completed',
    icon: SvgIcn(image: completedTaskSvg),
  ),
  const BottomNavigationBarItem(
    label: 'Canceled',
    icon: SvgIcn(image: cancelledTaskSvg),
  ),
  const BottomNavigationBarItem(
    label: 'Progress',
    icon: SvgIcn(image: progressTaskSvg),
  ),
];
