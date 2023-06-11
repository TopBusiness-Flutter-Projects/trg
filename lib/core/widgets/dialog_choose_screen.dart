// import 'dart:io';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../utils/app_colors.dart';
// import '../utils/assets_manager.dart';
// import 'audio_player_widget.dart';
// import 'audio_recorder_widget.dart';
//
// class RecordWidget extends StatefulWidget {
//   const RecordWidget(
//       {Key? key, required this.type, required this.sendType, required this.id})
//       : super(key: key);
//   final String type;
//   final String sendType;
//   final int id;
//
//   @override
//   State<RecordWidget> createState() => _RecordWidgetState();
// }
//
// class _RecordWidgetState extends State<RecordWidget> {
//   bool showPlayer = false;
//   String? audioPath;
//
//   @override
//   void initState() {
//     showPlayer = false;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.sendType == 'question') {
//       return BlocBuilder<ExamCubit, ExamState>(
//         builder: (context, state) {
//           ExamCubit cubit = context.read<ExamCubit>();
//           return widget.type == 'voice'
//               ? Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(height: 25),
//                     showPlayer
//                         ? Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 25),
//                             child: AudioPlayer(
//                               source: audioPath!,
//                               onDelete: () {
//                                 setState(() => showPlayer = false);
//                               },
//                               type: 'upload',
//                             ),
//                           )
//                         : AudioRecorder(
//                             onStop: (path) {
//                               if (kDebugMode)
//                                 print('Recorded file path: $path');
//                               setState(() {
//                                 audioPath = path;
//                                 cubit.audioPath[cubit.index] = path;
//                                 cubit.imagePath[cubit.index] = '';
//                                 showPlayer = true;
//                               });
//                             },
//                           ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 6),
//                       child: Row(
//                         children: [
//                           showPlayer
//                               ? TextButton(
//                                   onPressed: () {
//                                     cubit.addAnswer('audio');
//
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text('sent'.tr()),
//                                 )
//                               : SizedBox(width: 12),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text('cancel'.tr()),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 )
//               : Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(height: 25),
//                     cubit.imagePath.isEmpty
//                         ? Image.asset(ImageAssets.noImage)
//                         : Image.file(
//                             File(
//                               cubit.imagePath[cubit.index],
//                             ),
//                             width: 140.0,
//                             height: 140.0,
//                             fit: BoxFit.cover,
//                           ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 80, vertical: 6),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               cubit.pickImage(type: 'camera');
//                             },
//                             icon: Icon(
//                               Icons.camera_alt,
//                               color: AppColors.gray,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               cubit.pickImage(type: 'photo');
//                             },
//                             icon: Icon(
//                               Icons.photo,
//                               color: AppColors.gray,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 6),
//                       child: Row(
//                         children: [
//                           cubit.imagePath.isNotEmpty
//                               ? TextButton(
//                                   onPressed: () {
//                                     cubit.addAnswer('image');
//
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text('sent'.tr()),
//                                 )
//                               : SizedBox(width: 12),
//                           TextButton(
//                             onPressed: () {
//                               cubit.imagePath[cubit.index] = '';
//                               Navigator.pop(context);
//                             },
//                             child: Text('cancel'.tr()),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 );
//         },
//       );
//     } else if (widget.sendType == 'suggest') {
//       return BlocBuilder<ProfileCubit, ProfileState>(
//         builder: (context, state) {
//           ProfileCubit cubit = context.read<ProfileCubit>();
//           return widget.type == 'voice'
//               ? Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(height: 25),
//                     showPlayer
//                         ? Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 25),
//                             child: AudioPlayer(
//                               source: audioPath!,
//                               onDelete: () {
//                                 setState(() => showPlayer = false);
//                               },
//                               type: 'upload',
//                             ),
//                           )
//                         : AudioRecorder(
//                             onStop: (path) {
//                               if (kDebugMode)
//                                 print('Recorded file path: $path');
//                               setState(() {
//                                 audioPath = path;
//                                 cubit.audioPath = path;
//                                 showPlayer = true;
//                               });
//                             },
//                           ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 6),
//                       child: Row(
//                         children: [
//                           showPlayer
//                               ? TextButton(
//                                   onPressed: () {
//                                     cubit.sendSuggest('audio');
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text('sent'.tr()),
//                                 )
//                               : SizedBox(width: 12),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text('cancel'.tr()),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 )
//               : Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(height: 25),
//                     cubit.suggestImagePath.isEmpty
//                         ? Image.asset(ImageAssets.noImage)
//                         : Image.file(
//                             File(cubit.suggestImagePath),
//                             width: 140.0,
//                             height: 140.0,
//                             fit: BoxFit.cover,
//                           ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 80, vertical: 6),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               cubit.pickImage(type: 'camera', screenType: 'suggest');
//                             },
//                             icon: Icon(
//                               Icons.camera_alt,
//                               color: AppColors.gray,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               cubit.pickImage(type: 'photo', screenType: 'suggest');
//                             },
//                             icon: Icon(
//                               Icons.photo,
//                               color: AppColors.gray,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 6,
//                       ),
//                       child: Row(
//                         children: [
//                           cubit.suggestImagePath.isNotEmpty
//                               ? TextButton(
//                                   onPressed: () {
//                                     cubit.sendSuggest('file');
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text('sent'.tr()),
//                                 )
//                               : SizedBox(width: 12),
//                           TextButton(
//                             onPressed: () {
//                               cubit.suggestImagePath = '';
//                               Navigator.pop(context);
//                             },
//                             child: Text('cancel'.tr()),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 );
//         },
//       );
//     } else {
//       return BlocBuilder<StudyPageCubit, StudyPageState>(
//         builder: (context, state) {
//           StudyPageCubit cubit = context.read<StudyPageCubit>();
//           return widget.type == 'voice'
//               ? Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(height: 25),
//                     showPlayer
//                         ? Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 25),
//                             child: AudioPlayer(
//                               source: audioPath!,
//                               onDelete: () {
//                                 setState(() => showPlayer = false);
//                               },
//                               type: 'upload',
//                             ),
//                           )
//                         : AudioRecorder(
//                             onStop: (path) {
//                               if (kDebugMode)
//                                 print('Recorded file path: $path');
//                               setState(() {
//                                 audioPath = path;
//                                 cubit.audioPath = path;
//                                 showPlayer = true;
//                               });
//                             },
//                           ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 6),
//                       child: Row(
//                         children: [
//                           showPlayer
//                               ? TextButton(
//                                   onPressed: () {
//                                     if (widget.sendType == 'comment') {
//                                       cubit.addComment(widget.id, 'audio');
//                                     } else {
//                                       cubit.addReply(widget.id, 'audio');
//                                     }
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text('sent'.tr()),
//                                 )
//                               : SizedBox(width: 12),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text('cancel'.tr()),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 )
//               : Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(height: 25),
//                     cubit.imagePath.isEmpty
//                         ? Image.asset(ImageAssets.noImage)
//                         : Image.file(
//                             File(cubit.imagePath),
//                             width: 140.0,
//                             height: 140.0,
//                             fit: BoxFit.cover,
//                           ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 80, vertical: 6),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               cubit.pickImage(type: 'camera');
//                             },
//                             icon: Icon(
//                               Icons.camera_alt,
//                               color: AppColors.gray,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               cubit.pickImage(type: 'photo');
//                             },
//                             icon: Icon(
//                               Icons.photo,
//                               color: AppColors.gray,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 6),
//                       child: Row(
//                         children: [
//                           cubit.imagePath.isNotEmpty
//                               ? TextButton(
//                                   onPressed: () {
//                                     if (widget.sendType == 'comment') {
//                                       cubit.addComment(widget.id, 'file');
//                                     } else {
//                                       cubit.addReply(widget.id, 'file');
//                                     }
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text('sent'.tr()),
//                                 )
//                               : SizedBox(width: 12),
//                           TextButton(
//                             onPressed: () {
//                               cubit.imagePath = '';
//                               Navigator.pop(context);
//                             },
//                             child: Text('cancel'.tr()),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 );
//         },
//       );
//     }
//   }
// }
