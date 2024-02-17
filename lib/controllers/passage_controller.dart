import 'dart:convert';

import 'package:alkitab_app/constants/url.dart';
import 'package:alkitab_app/models/passage_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:logger/logger.dart';

class PassageController extends GetxController {
  final String abbr;
  final int number;

  PassageController(this.abbr, this.number);

  var isLoading = false.obs;
  var logger = Logger();
  URL url = URL();
  PassageModel? model;
  final Dio _dio = Dio();

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      final response = await _dio.request(
        "${url.passage}passage=$abbr&num=$number",
        options: Options(method: 'GET'),
      );

      if (response.statusCode == 200) {
        logger.i("Get Data Passage From API");
        var result = jsonDecode(response.data);
        model = PassageModel.fromJson(result);
      }
    } catch (error) {
      logger.d(error);
    } finally {
      isLoading(false);
    }
  }
}
