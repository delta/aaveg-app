import 'package:aaveg_app/views/widgets/Calender/day_text.dart';
import 'package:aaveg_app/views/widgets/Calender/day_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CalenderWidget extends StatefulWidget {
  CalenderWidget({Key? key}) : super(key: key);

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget>
    with TickerProviderStateMixin {
  final dayList = new List<int>.generate(35, (i) => i + 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> monthList = ['JULY', 'AUGUST'];
    SwiperController swiperController = SwiperController();
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
                                onPressed: () => {swiperController.previous()},
                                icon: Icon(Icons.arrow_back_ios)),
                          ),
                          Expanded(
                              flex: 3,
                              child: Swiper(
                                itemCount: 2,
                                controller: swiperController,
                                itemBuilder: (context, index) => Center(
                                  child: Text(
                                    monthList[index],
                                    style: TextStyle(
                                        fontFamily: 'Anurati',
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                30,
                                        letterSpacing: 5),
                                  ),
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () => {swiperController.next()},
                                icon: Icon(Icons.arrow_forward_ios)),
                          ),
                        ])),
                    Expanded(
                      flex: 315,
                      child: Swiper(
                        itemCount: 2,
                        controller: swiperController,
                        itemBuilder: (context, index) => GridView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing:
                                MediaQuery.of(context).size.height / 60,
                            mainAxisExtent:
                                MediaQuery.of(context).size.height * 0.049,
                          ),
                          children: dayList.map((day) {
                            return DayWidget();
                          }).toList(),
                        ),
                      ),
                    ),
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
