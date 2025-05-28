import 'package:pedometer/pages/statictics/components/tab_model.dart';
import 'package:pedometer/pages/statictics/temp.dart';

class Config {
  static List<TabModel> getItems() => [
    TabModel(
      id: 0,
      text: 'Day',
      getWidget: () => Days(),
      isIconVisible: false,
      isSelected: true,
    ),
    TabModel(
      id: 1,
      text: 'Week',
      getWidget: () => Weeks(),
      isIconVisible: false,
      isSelected: true,
    ),
    TabModel(
      id: 2,
      text: 'Month',
      getWidget: () => Months(),
      isIconVisible: false,
      isSelected: true,
    ),
  ];
}
