// import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final double? appBarHeight;
//   final Widget? titleWidget;
//   final List<Widget>? actions;

//   const CustomAppBar({
//     super.key,
//     this.appBarHeight,
//     this.titleWidget,
//     this.actions,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return AppBar(
//       elevation: 1,
//       actionsPadding: EdgeInsets.all(0),
//       bottom: PreferredSize(
//         preferredSize: preferredSize,
//         child: Container(color: theme.colorScheme.onPrimary, height: 0.5),
//       ),
//       actions: actions ?? [],

//     );
//   }

//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(appBarHeight ?? kToolbarHeight);
// }
