import 'package:pedometer/pages/first_page.dart';
import 'package:pedometer/pages/schedule/schedule.dart';
import 'package:pedometer/pages/settings/settings.dart';
import 'package:pedometer/pages/statictics/statictics.dart';
import 'package:pedometer/widgets/bottombar/utils/navbar_item_model.dart';

class Config {
  static List<NavbarItemModel> getConfigItems() => [
    NavbarItemModel(
      id: 0,
      iconPath: 'assets/icons/home.svg',
      selectedIconPath: 'assets/icons/home.svg',
      label: 'Home',
      isSelected: true,
      isLabelVisible: false,
      getWidget: () => Schedule(),
    ),
    NavbarItemModel(
      id: 1,
      iconPath: 'assets/icons/calendar.svg',
      selectedIconPath: 'assets/icons/calendar.svg',
      label: 'Calender',
      isSelected: true,
      isLabelVisible: false,
      getWidget: () => Schedule(),
    ),
    NavbarItemModel(
      id: 2,
      iconPath: 'assets/icons/Star.svg',
      selectedIconPath: 'assets/icons/Star.svg',
      label: 'Statictics',
      isSelected: true,
      isLabelVisible: false,
      getWidget: () => Statictics(),
    ),
    NavbarItemModel(
      id: 3,
      iconPath: 'assets/icons/Woman.svg',
      selectedIconPath: 'assets/icons/Woman.svg',
      label: 'Settings',
      isSelected: true,
      isLabelVisible: false,
      getWidget: () => Settings(),
    ),
  ];
}
