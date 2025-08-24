import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/constants/app_color.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/constants/app_size_value.dart';
import 'package:weatherapp/constants/app_styles.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<Map<String, dynamic>> navItems;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.navItems,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.width;
    double tabWidth = screenWidth / navItems.length;
    double indicatorWidth = 78;
    double indicatorLeft =
        (currentIndex * tabWidth) + ((tabWidth - indicatorWidth) / 2);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColor.border,
            width: 1,
          ),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: onTap,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColor.weatherBlue,
              unselectedItemColor: AppColor.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: AppColor.white,
              elevation: 0,
              selectedIconTheme: IconThemeData(size: AppIconSize.medium),
              unselectedIconTheme: IconThemeData(size: AppIconSize.small),
              enableFeedback: false,
              items: navItems
                  .map((item) => BottomNavigationBarItem(
                        icon: SizedBox(
                          width: tabWidth,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildIcon(
                                  item['icon'],
                                  isActive: currentIndex == navItems.indexOf(item),
                                ),
                                if (currentIndex == navItems.indexOf(item))
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: AppPadding.hp2),
                                      child: Text(
                                        item['label'],
                                        style: getLargeTextStyle(
                                          color: AppColor.weatherBlue,
                                          fontSize: AppFontSize.small,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        label: '',
                      ))
                  .toList(),
            ),
          ),

          /// **Dynamic Indicator Positioning**
          Positioned(
            top: -1.5,
            left: indicatorLeft,
            child: Container(
              height: 3,
              width: indicatorWidth,
              decoration: BoxDecoration(
                color: AppColor.weatherBlue,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildIcon(dynamic icon, {required bool isActive}) {
    if (icon is String) {
      // asset path
      return Image.asset(
        icon,
        width: AppIconSize.medium,
        height: AppIconSize.medium,
        color: isActive ? AppColor.weatherBlue : AppColor.grey,
      );
    } else if (icon is IconData) {
      // material icon
      return Icon(
        icon,
        size: AppIconSize.large,
        color: isActive ? AppColor.weatherBlue : AppColor.grey,
      );
    }
    return SizedBox.shrink();
  }
}
