import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavStyle10 extends StatelessWidget {
  final NavBarEssentials? navBarEssentials;

  const BottomNavStyle10({super.key,
    this.navBarEssentials,
  });

  Widget _buildItem(
      PersistentBottomNavBarItem item, bool isSelected, double? height) {
    return navBarEssentials!.navBarHeight == 0
        ? const SizedBox.shrink()
        : AnimatedContainer(
      width: isSelected ? 120 : 50,
      height: height! / 1.5,
      duration:
      navBarEssentials!.itemAnimationProperties?.duration ??
          const Duration(milliseconds: 400),
      curve: navBarEssentials!.itemAnimationProperties?.curve ??
          Curves.ease,
      padding: EdgeInsets.all(item.contentPadding),
      decoration: isSelected
          ? BoxDecoration(
        color: isSelected
            ? item.activeColorPrimary
            : navBarEssentials!
            .backgroundColor!
            .withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      )
          : BoxDecoration(
        color: isSelected
            ? item.activeColorPrimary
            : navBarEssentials!
            .backgroundColor!
            .withOpacity(0.0),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        alignment: Alignment.center,
        height: height / 1.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconTheme(
                data: IconThemeData(
                    size: item.iconSize,
                    color: isSelected
                        ? (item.activeColorSecondary ?? item.activeColorPrimary)
                        : item.inactiveColorPrimary ?? item.activeColorPrimary),
                child: isSelected
                    ? item.icon
                    : item.inactiveIcon ?? item.icon,
              ),
            ),
            item.title == null
                ? const SizedBox.shrink()
                : isSelected
                ? Flexible(
              child: Material(
                type: MaterialType.transparency,
                child: FittedBox(
                    child: Text(
                      item.title!,
                      style: item.textStyle != null
                          ? (item.textStyle!.apply(
                          color: isSelected
                              ? (item.activeColorSecondary ?? item.activeColorPrimary)
                              : item.inactiveColorPrimary))
                          : TextStyle(
                          color:
                          (item.activeColorSecondary ?? item.activeColorPrimary),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0),
                    )),
              ),
            )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: this.navBarEssentials!.navBarHeight,
      padding: EdgeInsets.only(
          top: this.navBarEssentials!.padding?.top ??
              this.navBarEssentials!.navBarHeight! * 0.15,
          left: this.navBarEssentials!.padding?.left ??
              MediaQuery.of(context).size.width * 0.07,
          right: this.navBarEssentials!.padding?.right ??
              MediaQuery.of(context).size.width * 0.07,
          bottom: this.navBarEssentials!.padding?.bottom ??
              this.navBarEssentials!.navBarHeight! * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: this.navBarEssentials!.items!.map((item) {
          int index = this.navBarEssentials!.items!.indexOf(item);
          return Flexible(
            flex: this.navBarEssentials!.selectedIndex == index ? 2 : 1,
            child: GestureDetector(
              onTap: () {
                if (this.navBarEssentials!.items![index].onPressed != null) {
                  this.navBarEssentials!.items![index].onPressed!(
                      this.navBarEssentials!.selectedScreenBuildContext);
                } else {
                  this.navBarEssentials!.onItemSelected!(index);
                }
              },
              child: Container(
                color: Colors.transparent,
                child: _buildItem(
                    item,
                    this.navBarEssentials!.selectedIndex == index,
                    this.navBarEssentials!.navBarHeight),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
