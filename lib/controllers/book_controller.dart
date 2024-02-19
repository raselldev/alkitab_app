import 'dart:convert';

import 'package:alkitab_app/constants/url.dart';
import 'package:alkitab_app/models/book_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:logger/logger.dart';

class BookController extends GetxController {
  var isLoading = false.obs;
  var logger = Logger();
  BookModel? model;
  URL url = URL();
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
        url.book,
        options: Options(method: 'GET'),
      );

      if (response.statusCode == 200) {
        logger.i("Get Data Book From API");
        var result = jsonDecode(response.data);
        model = BookModel.fromJson(result);
      }
    } catch (error) {
      logger.d(error);
    } finally {
      isLoading(false);
    }
  }
}
