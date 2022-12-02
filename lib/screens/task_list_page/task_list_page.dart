import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_controller.dart';
import 'package:todo_app_getx/screens/widgets/custom_slider_widget.dart';

class TaskListPage extends GetView<TaskListController> {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('BUILDDD');
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                title: GetBuilder(
                    init: controller,
                    builder: (_) {
                      return Text(controller.taskBase.name ?? 'Task List');
                    }),
                elevation: .0,
                backgroundColor: Colors.transparent,
                bottom: const TabBar(
                  indicatorColor: Color(0xFF5D45DA),
                  tabs: [
                    Tab(
                      text: 'To Do',
                    ),
                    Tab(
                      text: 'Complated',
                    )
                  ],
                ),
              ),
              body: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomSliderWidget(
                        sliderKey: 'first',
                        onValueChanged: (p0) {},
                        time: 'Today',
                        title: 'To do',
                        isComplated: true,
                        isFavourite: true,
                        onDeletePressed: (context) {},
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomSliderWidget(
                        sliderKey: 'first',
                        onValueChanged: (p0) {},
                        time: 'Today',
                        title: 'To do',
                        isComplated: true,
                        isFavourite: true,
                        onDeletePressed: (context) {},
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomSliderWidget(
                        sliderKey: 'first',
                        onValueChanged: (p0) {},
                        time: 'Today',
                        title: 'To do',
                        isComplated: true,
                        isFavourite: true,
                        onDeletePressed: (context) {},
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomSliderWidget(
                        sliderKey: 'first',
                        onValueChanged: (p0) {},
                        time: 'Today',
                        title: 'To do',
                        isComplated: true,
                        isFavourite: true,
                        onDeletePressed: (context) {},
                      )),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GetBuilder<TaskListController>(
                  init: controller,
                  builder: (_) {
                    if (controller.isButton) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 5.h),
                        child: Card(
                          elevation: .0,
                          margin: EdgeInsets.zero,
                          color: Colors.black.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.w)),
                          child: ListTile(
                            dense: true,
                            onTap: () {
                              controller.onButtonHide(false);
                              FocusScope.of(context)
                                  .requestFocus(controller.focusNode);
                            },
                            minLeadingWidth: 10.w,
                            leading: const Icon(Icons.add),
                            title: const Text('Add task'),
                          ),
                        ),
                      );
                    }
                    return Card(
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CheckboxListTile(
                              value: false,
                              dense: true,
                              tileColor: Colors.transparent,
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: -3),
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (value) {},
                              title: TextField(
                                textInputAction: TextInputAction.done,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: .0),
                                    border: InputBorder.none,
                                    hintText: 'Task name'),
                                onSubmitted: (value) {
                                  controller.onButtonHide(true);

                                  FocusScope.of(context).unfocus();

                                  controller.clearText();
                                },
                                focusNode: controller.focusNode,
                                controller: controller.taskController,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -10),
                              child: Divider(
                                indent: 20.w,
                                endIndent: 20.w,
                                thickness: 2.h,
                              ),
                            )
                          ],
                        ));
                  }))
        ],
      ),
    );
  }
}
