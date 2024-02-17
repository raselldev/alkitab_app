import 'package:alkitab_app/components/custom_elevated_button.dart';
import 'package:alkitab_app/models/book_model.dart';
import 'package:alkitab_app/screens/passage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoosePassage extends StatelessWidget {
  const ChoosePassage({Key? key, required this.model}) : super(key: key);

  final BookData? model;

  Future<void> _passage(int number) async {
    var abbr = model?.abbr ?? "";
    var name = model?.name ?? "";
    Get.to(() => Passage(
          name: name,
          abbr: abbr,
          number: number,
        ));
  }

  @override
  Widget build(BuildContext context) {
    var text = model?.name ?? "";
    var countData = model?.chapter ?? 0;

    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 100),
      title: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: List.generate(
            countData,
            (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  4,
                  (colIndex) {
                    final index = rowIndex * 4 + colIndex;
                    return index < countData
                        ? SizedBox(
                            width: 75,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CustomElevatedButton(
                                onPressed: () => _passage(index + 1),
                                text: "${index + 1}".toString(),
                                fontSize: 9,
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
