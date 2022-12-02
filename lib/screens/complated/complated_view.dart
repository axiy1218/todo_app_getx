import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_app_getx/screens/complated/complated_controller.dart';
import 'package:todo_app_getx/screens/widgets/custom_slider_widget.dart';

class ComplatedView extends GetView<ComplatedController> {
  const ComplatedView({super.key});

  @override
  Widget build(BuildContext context) {
    log('BUILDDD');
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: const Text('Complated'),
        elevation: .0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(20.w),
              child: CustomSliderWidget(
                sliderKey: 'first',
                onValueChanged: (p0) {},
                time: 'Today',
                title: 'To do',
                isComplated: true,
                isFavourite: true,
                onDeletePressed: (context) {},
              ))
        ],
      ),
    );
  }
}
