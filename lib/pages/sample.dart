import 'package:aaveg_app/controllers/sample_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sample extends StatefulWidget {
  Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  // finds your controller and uses it
  final sampleController = Get.find<SampleController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Obx used to update the counter value whenever it changes
                Obx(() => Text(
                      '${sampleController.counter}',
                      style: TextStyle(fontSize: 30),
                    )), // displays the counter value from SampleController()
                ElevatedButton(
                  child: Text('Add It'),
                  onPressed: () {
                    sampleController
                        .increment(); // calls increment function in the SampleController()
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
