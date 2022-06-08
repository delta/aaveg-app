import 'package:aaveg_app/views/widgets/Calender/day_text.dart';
import 'package:aaveg_app/views/widgets/Calender/day_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CalenderWidget extends StatefulWidget {
  CalenderWidget({Key? key}) : super(key: key);

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget>
    with TickerProviderStateMixin {
  final dayList = new List<int>.generate(35, (i) => i + 1);
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Expanded(
          flex: 10,
          child: Expanded(
            flex: 1,
            child: Column(children: [
              Expanded(flex: 50, child: SizedBox()),
              Expanded(flex: 315, child: DayText())
            ]),
          ),
        ),
        Expanded(
          flex: 15,
          child: TabBarView(controller: _tabController, children: [
            Column(children: [
              Expanded(
                  flex: 50,
                  child: AutoSizeText(
                    'JULY',
                    minFontSize: 20,
                    maxFontSize: 35,
                    style: TextStyle(
                        fontFamily: 'Anurati', fontSize: 40, letterSpacing: 5),
                  )),
              Expanded(
                flex: 315,
                child: GridView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 40,
                  ),
                  children: dayList.map((day) {
                    return DayWidget();
                  }).toList(),
                ),
              ),
            ]),
            Column(children: [
              Expanded(
                  flex: 50,
                  child: Text(
                    'AUGUST',
                    style: TextStyle(
                        fontFamily: 'Anurati', fontSize: 40, letterSpacing: 5),
                  )),
              Expanded(
                flex: 315,
                child: GridView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 40,
                  ),
                  children: dayList.map((day) {
                    return DayWidget();
                  }).toList(),
                ),
              ),
            ]),
          ]),
        ),
      ]),
    );
  }
}
