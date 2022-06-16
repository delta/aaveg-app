import 'package:aaveg_app/controllers/calendar_page_controller.dart';

import 'package:aaveg_app/views/widgets/Calender/day_text.dart';
import 'package:aaveg_app/views/widgets/Calender/day_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalenderWidget extends GetView<CalendarPageController> {
  @override
  Widget build(BuildContext context) {
    List<String> monthList = [
      'JANUARY',
      'FEBUARY',
      'MARCH',
      'APRIL',
      'MAY',
      'JUNE',
      'JULY',
      'AUGUST',
      'SEPTEMBER',
      'OCTOBER',
      'NOVEMBER',
      'DECEMBER'
    ];
    List<int> noOfItems = [37, 35, 35, 35, 35, 35, 37, 35, 35, 37, 35, 35];
    final dayList = new List<int>.generate(37, (i) => i + 1);

    final CalenderTabController _tabx = Get.put(CalenderTabController());
    var _tabBarController = _tabx.tabController;

    return Container(
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.65),
                borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Column(children: [
                    Expanded(flex: 50, child: SizedBox()),
                    Expanded(flex: 315, child: DayText())
                  ]),
                ),
                Expanded(
                  flex: 20,
                  child: Column(children: [
                    Expanded(
                        flex: 50,
                        child: Row(children: [
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  _tabBarController.index == 0
                                      ? _tabBarController.animateTo(11)
                                      : _tabBarController.animateTo(
                                          _tabBarController.index - 1);
                                },
                                icon: Icon(Icons.arrow_back_ios)),
                          ),
                          Expanded(
                              flex: 3,
                              child: TabBar(
                                  controller: _tabBarController,
                                  isScrollable: true,
                                  indicatorColor: Colors.transparent,
                                  tabs: [
                                    for (var i = 0; i < 12; i++)
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Center(
                                          child: Text(
                                            monthList[i],
                                            style: TextStyle(
                                                fontFamily: 'Anurati',
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    30,
                                                letterSpacing: 5),
                                          ),
                                        ),
                                      ),
                                  ])),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  _tabBarController.index == 11
                                      ? _tabBarController.animateTo(0)
                                      : _tabBarController.animateTo(
                                          _tabBarController.index + 1);
                                },
                                icon: Icon(Icons.arrow_forward_ios)),
                          ),
                        ])),
                    Expanded(
                        flex: 315,
                        child: controller.obx(
                          (eventList) {
                            return TabBarView(
                              controller: _tabBarController,
                              children: [
                                for (var month in monthList)
                                  GridView(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    physics: ScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 7,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing:
                                                MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60,
                                            // mainAxisExtent:
                                            //     MediaQuery.of(context).size.width *
                                            //         0.17,
                                            childAspectRatio: 1 / 1.15),
                                    children: new List<int>.generate(
                                        noOfItems[monthList.indexOf(month)],
                                        (i) => i + 1).map((day) {
                                      return DayWidget(
                                        thisDay: dayList.indexOf(day),
                                        thisMonth: monthList.indexOf(month) + 1,
                                        eventDatesThisMonth: eventList!.events!,
                                      );
                                    }).toList(),
                                  ),
                              ],
                            );
                          },
                        )),
                  ]),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class CalenderTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 12);
    super.onInit();
  }
}
