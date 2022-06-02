import 'package:aaveg_app/controllers/originstory_controller.dart';
import 'package:aaveg_app/views/widgets/OriginStory/story_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OriginStoryPage extends StatefulWidget {
  OriginStoryPage({Key? key}) : super(key: key);

  @override
  State<OriginStoryPage> createState() => _SampleState();
}

class _SampleState extends State<OriginStoryPage>
    with TickerProviderStateMixin {
  // finds your controller and uses it
  final sampleController = Get.find<OriginStoryController>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/sci-fi_city_bg.png'))),
        child: Column(
          children: [
            Expanded(child: SizedBox(), flex: 20),
            Expanded(
                flex: 92,
                child: Center(
                  child: Text('ORIGIN STORY',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontSize: 42,
                      )),
                )),
            Expanded(
              flex: 65,
              child: Container(
                decoration: BoxDecoration(color: Color.fromARGB(1, 97, 11, 11)),
                child: TabBar(controller: _tabController, tabs: [
                  Tab(
                      icon: Image.asset(
                          'assets/images/Aaveg Glyph - White 1.png')),
                  Tab(icon: Image.asset('assets/images/chakraa logo 1.png')),
                  Tab(icon: Image.asset('assets/images/paasha logo 1.png')),
                  Tab(icon: Image.asset('assets/images/paras logo 1.png')),
                  Tab(icon: Image.asset('assets/images/saaranga logo 1.png')),
                  Tab(icon: Image.asset('assets/images/vajr logo 1.png')),
                ]),
              ),
            ),
            Expanded(
              flex: 620,
              child: TabBarView(
                  controller: _tabController,
                  children: const <Widget>[
                    StoryField(),
                    StoryField(),
                    StoryField(),
                    StoryField(),
                    StoryField(),
                    StoryField(),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
