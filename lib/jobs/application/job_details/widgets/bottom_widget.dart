import 'package:flutter/material.dart';
import 'package:ioniconf_2021_flutter/core/theme/colors.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      color: ThemeColors.bottomWidgetBackgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.share_outlined, color: ThemeColors.toolBarColor ),
              Text("ShiftShare™", style: TextStyle(color: ThemeColors.toolBarColor )),
            ],
          ),
          _buildVerticalDivider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.send_outlined, color: ThemeColors.toolBarColor ,),
              Text("Request Job", style: TextStyle(color: ThemeColors.toolBarColor )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 1,
        height: 40,
        color: ThemeColors.toolBarColor,
      ),
    );
  }
}
