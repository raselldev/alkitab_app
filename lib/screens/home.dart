import 'package:alkitab_app/components/custom_elevated_button.dart';
import 'package:alkitab_app/controllers/book_controller.dart';
import 'package:alkitab_app/models/book_model.dart';
import 'package:alkitab_app/screens/choose_passage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class Home extends StatelessWidget {
  final BookController bookController = Get.put(BookController());
  final Logger logger = Logger();
  Home({Key? key}) : super(key: key);

  void _passage(BookData? model) async {
    Get.dialog(ChoosePassage(
      model: model,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alkitab App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => bookController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: List.generate(
                    (bookController.model?.data?.length ?? 0 / 3).ceil(),
                    (rowIndex) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          3,
                          (colIndex) {
                            final index = rowIndex * 3 + colIndex;
                            return index <
                                    (bookController.model?.data?.length ?? 0)
                                ? SizedBox(
                                    width: 90,
                                    child: CustomElevatedButton(
                                      onPressed: () => _passage(
                                          bookController.model?.data?[index]),
                                      text: bookController
                                              .model?.data?[index].abbr ??
                                          "no data",
                                      fontSize: null,
                                    ),
                                  )
                                : const SizedBox(); // Use SizedBox for empty cells if the data is not a multiple of 3
                          },
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
