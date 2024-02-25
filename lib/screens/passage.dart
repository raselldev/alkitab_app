import 'package:alkitab_app/controllers/passage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Passage extends StatelessWidget {
  const Passage(
      {Key? key, required this.abbr, required this.number, required this.name})
      : super(key: key);

  final String abbr;
  final int number;
  final String name;

  @override
  Widget build(BuildContext context) {
    final PassageController passageController =
        Get.put(PassageController(abbr, number));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(color: Colors.white),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => passageController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        passageController.model?.bible?.book?.title ?? "",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView(
                      children: List.generate(
                        (passageController.model?.bible?.book?.chapter?.verses
                                    ?.length ??
                                0)
                            .ceil(),
                        (rowIndex) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                passageController.model?.bible?.book?.chapter
                                        ?.verses?[rowIndex]
                                        .toString() ??
                                    "",
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
