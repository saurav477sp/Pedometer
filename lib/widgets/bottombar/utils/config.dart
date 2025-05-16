import 'package:pedometer/pages/home/main_screen.dart';
import 'package:pedometer/pages/schedule/schedule.dart';
import 'package:pedometer/pages/settings/settings.dart';
import 'package:pedometer/pages/statictics/statictics.dart';
import 'package:pedometer/widgets/bottombar/utils/navbar_item_model.dart';

class Config {
  static List<NavbarItemModel> getConfigItems() => [
    NavbarItemModel(
      id: 0,
      iconPath: 'assets/icons/home.svg',
      selectedIconPath: 'assets/icons/Help.svg',
      label: 'Home',
      isSelected: true,
      isLabelVisible: true,
      getWidget: () => MainScreen(),
    ),
    NavbarItemModel(
      id: 1,
      iconPath: 'assets/icons/calendar.svg',
      selectedIconPath: 'assets/icons/Calender.svg',
      label: 'Calender',
      isSelected: true,
      isLabelVisible: true,
      getWidget: () => Schedule(),
    ),
    NavbarItemModel(
      id: 2,
      iconPath: 'assets/icons/Star.svg',
      selectedIconPath: 'assets/icons/Stored.svg',
      label: 'Home',
      isSelected: true,
      isLabelVisible: true,
      getWidget: () => Statictics(),
    ),
    NavbarItemModel(
      id: 3,
      iconPath: 'assets/icons/Woman.svg',
      selectedIconPath: 'assets/icons/Wishlist.svg',
      label: 'Home',
      isSelected: true,
      isLabelVisible: true,
      getWidget: () => Settings(),
    ),
  ];
}
