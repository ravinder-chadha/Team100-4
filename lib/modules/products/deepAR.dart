// import 'package:flutter/material.dart';
// import 'package:rwa_deep_ar/rwa_deep_ar.dart';

// class DeepAr extends StatefulWidget {
//   const DeepAr({Key? key}) : super(key: key);

//   @override
//   State<DeepAr> createState() => _DeepArState();
// }

// class _DeepArState extends State<DeepAr> {
//   late CameraDeepArController cameraDeepArController;
//   int currentPage = 0;
//   final vp = PageController(viewportFraction: .24);
//   Effects currentEffect = Effects.none;
//   Filters currentFilter = Filters.none;
//   Masks currentMask = Masks.none;
//   bool isRecording = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//           children: [
//             CameraDeepAr(
//                 onCameraReady: (isReady) {
//                   print("Camera status $isReady");
//                 },
//                 onImageCaptured: (path) {
//                   print("Image Taken $path");
//                 },
//                 onVideoRecorded: (path) {
//                   print("Video Recorded @ $path");
//                 },
//                 androidLicenceKey:
//                 "53618212114fc16bbd7499c0c04c2ca11a4eed188dc20ed62a7f7eec02b41cb34d638e72945a6bf6",
//                 iosLicenceKey:
//                 "53618212114fc16bbd7499c0c04c2ca11a4eed188dc20ed62a7f7eec02b41cb34d638e72945a6bf6",
//                 cameraDeepArCallback: (c) async {
//                   cameraDeepArController = c;
//                   setState(() {});
//                 }),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
//                 //height: 250,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: List.generate(Masks.values.length, (p) {
//                           bool active = currentPage == p;
//                           return GestureDetector(
//                             onTap: () {
//                               currentPage = p;
//                               cameraDeepArController.changeMask(p);
//                               setState(() {});
//                             },
//                             child: Container(
//                                 margin: EdgeInsets.all(5),
//                                 width: active ? 40 : 30,
//                                 height: active ? 50 : 40,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     color:
//                                     active ? Colors.green : Colors.white,
//                                     shape: BoxShape.circle),
//                                 child: Text(
//                                   "$p",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: active ? 16 : 14,
//                                       color: Colors.black, fontWeight: FontWeight.w800),
//                                 )),
//                           );
//                         }),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//   }
// }