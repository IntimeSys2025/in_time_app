// import 'package:flutter/material.dart';
// import 'package:in_time_app/core/utils/app_font_size.dart';
//
// class ContentPageBottomSheet extends StatelessWidget {
//   final String title;
//   final Widget contentPageWidget;
//   const ContentPageBottomSheet(
//       {super.key, required this.title, required this.contentPageWidget});
//
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//
//       initialChildSize: 0.85,
//       minChildSize: 0.5,
//       maxChildSize: 0.95,
//       expand: false,
//       builder: (context, scrollController) {
//         return SafeArea(
//           child: Column(
//             children: [
//               // drag handle
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 10),
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade400,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//
//               // header
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         fontSize: AppFontSize.fontSize16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close),
//                       onPressed: () => Navigator.pop(context),
//                     )
//                   ],
//                 ),
//               ),
//
//               const Divider(height: 1),
//               SingleChildScrollView(
//                 controller: scrollController,
//                 child: SizedBox(
//                   height: 400,
//                   child: Text("HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "kkkkkkkkk\n"
//                       "kkkkkkkkk\n"
//                       "Asmaa1\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "kkkkkkkkk\n"
//                       "kkkkkkkkk\n"
//                       "Asmaa2\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "kkkkkkkkk\n"
//                       "kkkkkkkkk\n"
//                       "Asmaa3\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "HI\n"
//                       "Hey\n"
//                       "kkkkkkkkk\n"
//                       "kkkkkkkkk\n"
//                       "Asmaa4\n"
//                   ),
//                 ),
//               )
//
//               // Text("HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "kkkkkkkkk\n"
//               //     "kkkkkkkkk\n"
//               //     "Asmaa1\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "kkkkkkkkk\n"
//               //     "kkkkkkkkk\n"
//               //     "Asmaa2\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "kkkkkkkkk\n"
//               //     "kkkkkkkkk\n"
//               //     "Asmaa3\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "HI\n"
//               //     "Hey\n"
//               //     "kkkkkkkkk\n"
//               //     "kkkkkkkkk\n"
//               //     "Asmaa4\n"
//               // ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// // void showPolicyBottomSheet({
// //   required BuildContext context,
// //   required String title,
// //   required String url,
// //   required Widget widget
// // }) {
// //   // final controller = WebViewController()
// //   //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
// //   //   ..loadRequest(Uri.parse(url));
// //
// //   showModalBottomSheet(
// //     context: context,
// //     isScrollControlled: true,
// //     useSafeArea: true,
// //     shape: const RoundedRectangleBorder(
// //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
// //     ),
// //     builder: (_) {
// //       return DraggableScrollableSheet(
// //         initialChildSize: 0.85,
// //         minChildSize: 0.5,
// //         maxChildSize: 0.95,
// //         expand: false,
// //         builder: (context, scrollController) {
// //           return Column(
// //             children: [
// //               // drag handle
// //               Container(
// //                 margin: const EdgeInsets.symmetric(vertical: 10),
// //                 width: 40,
// //                 height: 4,
// //                 decoration: BoxDecoration(
// //                   color: Colors.grey.shade400,
// //                   borderRadius: BorderRadius.circular(2),
// //                 ),
// //               ),
// //
// //               // header
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// //                 child: Row(
// //                   children: [
// //                     Expanded(
// //                       child: Text(
// //                         title,
// //                         style: const TextStyle(
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.w600,
// //                         ),
// //                       ),
// //                     ),
// //                     IconButton(
// //                       icon: const Icon(Icons.close),
// //                       onPressed: () => Navigator.pop(context),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //
// //               const Divider(height: 1),
// //
// //               // WebView
// //               const Expanded(
// //                 child: Text("HI\n"
// //                     "Hey\n"
// //                     "HI\n"
// //                     "Hey\n"
// //                     "HI\n"
// //                     "Hey\n"
// //                     "HI\n"
// //                     "Hey\n"
// //                     "HI\n"
// //                     "Hey\n"
// //                     "kkkkkkkkk\n"
// //                     "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
// //                     "Asmaa\n"
// //                     "jkkkkkkkkkkkkkkkkkkkkkkkkkhfgdsfgfhjuytrtkyhfjjjklk"
// //                     "jkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkjjkkjkj"
// //                     "jhgggggggggggggggggggggjjhhhhhhhhhhhhhhhhhhhhhhh\n"
// //                     "gfffffffffffffffffffffffffffffffffffffffffffffh"
// //                     "gfffffffffffffffffffffffffffffffffffffffffffhhgggggggggf"
// //                     "ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhgj"
// //                     "ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
// //                     "hjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj"
// //                     "fddddddddddddddddddddddgfddddddddddgfgggggggg\n"
// //                     "rteeeeeeeeeeetreeeeeeeeeeeeeeeeeeeeeeeeeeeeeerte\n"
// //                     "efwrrrrrrrrrrrrrrrrrrrrrrrrrrrfdsgssssfffffffffgffdggfdgdfgggfdgdfgfdfdgdgfd"
// //                     "jhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhkkkkjjjjjjjjjjjjjjjkhjkjh\n"
// //                     "ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhghgfh"
// //                     "fdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddgggggggggggggggfdgfd"
// //                     "jhhhhhhhkkkkkkkkjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhk\n"
// //                     "khgggggggggggggggggggggggggggggggggggggggggggggggggggkjh\n"
// //                     "ryyyyyyyyyyyyyyyyyyyyyyyyyyyy\n"
// //                     "yuuuuuuuuuuuuuuuuuui\n"
// //                     "uyhighhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhkkkkkjhl\n"
// //                     "uygutgjjjjjjjjjhkllllllllllllllllllllllllll;k;;lk\n"
// //                     "yiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii\n"
// //                     "ygujjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjhjjjjjjjhg\n"
// //                     "uhiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiuu\n"
// //                     "jklllllllllllllllllllllllllllllllllllllllllllllllllllllkj\n"
// //                     "ipppppppppppppppppppppppppppppppppppppppppppppppp\n"
// //                     "uoooooooooooooooooooooooooooooooooooooooooouioiuoui\n"
// //                     "yuuuuuuuuuuuuuutydfghjk;;;;;;;;;;llllllllllluiiiuiuoioi\n"
// //                     "iuuuuuuuuughhhhhhhhhhhhhhhhhhhhhlkkkkkkkkkkkk;ll';l'l;"
// //                     "kjlllllllllllllllllllllkjjjjjjjjjjjjlkkkkkkkkkkkkkl\n"),
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //     },
// //   );
// //
// //
// //
// //
// //   // showModalBottomSheet(
// //   //   context: context,
// //   //   isScrollControlled: true,
// //   //   useSafeArea: true,
// //   //   shape: const RoundedRectangleBorder(
// //   //     borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
// //   //   ),
// //   //   builder: (_) {
// //   //     return DraggableScrollableSheet(
// //   //       initialChildSize: 0.85,
// //   //       minChildSize: 0.5,
// //   //       maxChildSize: 0.95,
// //   //       expand: false,
// //   //       builder: (context, scrollController) {
// //   //         return Column(
// //   //           children: [
// //   //             // drag handle
// //   //             Container(
// //   //               margin: const EdgeInsets.symmetric(vertical: 10),
// //   //               width: 40,
// //   //               height: 4,
// //   //               decoration: BoxDecoration(
// //   //                 color: Colors.grey.shade400,
// //   //                 borderRadius: BorderRadius.circular(2),
// //   //               ),
// //   //             ),
// //   //
// //   //             // header
// //   //             Padding(
// //   //               padding: const EdgeInsets.symmetric(horizontal: 16),
// //   //               child: Row(
// //   //                 children: [
// //   //                   Expanded(
// //   //                     child: Text(
// //   //                       title,
// //   //                       style: const TextStyle(
// //   //                         fontSize: 16,
// //   //                         fontWeight: FontWeight.w600,
// //   //                       ),
// //   //                     ),
// //   //                   ),
// //   //                   IconButton(
// //   //                     icon: const Icon(Icons.close),
// //   //                     onPressed: () => Navigator.pop(context),
// //   //                   )
// //   //                 ],
// //   //               ),
// //   //             ),
// //   //
// //   //             const Divider(height: 1),
// //   //
// //   //             // WebView
// //   //             Expanded(
// //   //               child: Text("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
// //   //                   "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
// //   //                   "lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll"
// //   //                   "kkkkkkkkkk"
// //   //                   "kkkkkkkkkkkkkkkkkkkk"
// //   //                   "kkkkkkkkk\n"
// //   //                   "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
// //   //                   "jjjjjjjjjjdfgggggggggggggggggggggfgdffdhhfhfdhhhhhhhhhd"
// //   //                   "jkkkkkkkkkkkkkkkkkkkkkkkkkhfgdsfgfhjuytrtkyhfjjjklk"
// //   //                   "jkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkjjkkjkj"
// //   //                   "jhgggggggggggggggggggggjjhhhhhhhhhhhhhhhhhhhhhhh\n"
// //   //                   "gfffffffffffffffffffffffffffffffffffffffffffffh"
// //   //                   "gfffffffffffffffffffffffffffffffffffffffffffhhgggggggggf"
// //   //                   "ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhgj"
// //   //                   "ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
// //   //                   "hjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj"
// //   //                   "fddddddddddddddddddddddgfddddddddddgfgggggggg\n"
// //   //                   "rteeeeeeeeeeetreeeeeeeeeeeeeeeeeeeeeeeeeeeeeerte\n"
// //   //                   "efwrrrrrrrrrrrrrrrrrrrrrrrrrrrfdsgssssfffffffffgffdggfdgdfgggfdgdfgfdfdgdgfd"
// //   //                   "jhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhkkkkjjjjjjjjjjjjjjjkhjkjh\n"
// //   //                   "ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhghgfh"
// //   //                   "fdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddgggggggggggggggfdgfd"
// //   //                   "jhhhhhhhkkkkkkkkjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhk\n"
// //   //                   "khgggggggggggggggggggggggggggggggggggggggggggggggggggkjh\n"
// //   //                   "ryyyyyyyyyyyyyyyyyyyyyyyyyyyy\n"
// //   //                   "yuuuuuuuuuuuuuuuuuui\n"
// //   //                   "uyhighhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhkkkkkjhl\n"
// //   //                   "uygutgjjjjjjjjjhkllllllllllllllllllllllllll;k;;lk\n"
// //   //                   "yiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii\n"
// //   //                   "ygujjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjhjjjjjjjhg\n"
// //   //                   "uhiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiuu\n"
// //   //                   "jklllllllllllllllllllllllllllllllllllllllllllllllllllllkj\n"
// //   //                   "ipppppppppppppppppppppppppppppppppppppppppppppppp\n"
// //   //                   "uoooooooooooooooooooooooooooooooooooooooooouioiuoui\n"
// //   //                   "yuuuuuuuuuuuuuutydfghjk;;;;;;;;;;llllllllllluiiiuiuoioi\n"
// //   //                   "iuuuuuuuuughhhhhhhhhhhhhhhhhhhhhlkkkkkkkkkkkk;ll';l'l;"
// //   //                   "kjlllllllllllllllllllllkjjjjjjjjjjjjlkkkkkkkkkkkkkl\n"),
// //   //             ),
// //   //           ],
// //   //         );
// //   //       },
// //   //     );
// //   //   },
// //   // );
// // }
