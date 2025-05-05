// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pedometer/theme/custom_colors.dart';

// class EmailField extends StatelessWidget {
//   final TextEditingController textEditingController;
//   final double? width;
//   final String text;
//   final Color color;
//   const EmailField(
//       {super.key,
//       required this.textEditingController,
//       this.width,
//       this.color = CustomColors.fieldColor,
//       required this.text});

//   static Size size = Get.size;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width ?? size.width * 0.9,
//       alignment: Alignment.center,
//       decoration:
//           BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
//       child: TextField(
//         controller: textEditingController,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           hintText: text,
//           contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//         ),
//         onChanged: (value) {},
//       ),
//     );
//   }
// }
