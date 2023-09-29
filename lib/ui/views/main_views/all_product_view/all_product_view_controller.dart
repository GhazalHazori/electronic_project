import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/model/apis/product_model.dart';
import 'package:flutter_application_1/core/data/repositories/category_repository.dart';
import 'package:flutter_application_1/core/data/repositories/product_repository.dart';
import 'package:flutter_application_1/core/enums/message_type.dart';
import 'package:flutter_application_1/core/enums/operation_type.dart';
import 'package:flutter_application_1/core/enums/request_statues.dart';
import 'package:flutter_application_1/core/services/base_controller.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_toast.dart';

import 'package:get/get.dart';

class AllProductController extends BaseControoler {
  RxList<String> categoryList = <String>[].obs;
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductModel> filteredProductsList = <ProductModel>[].obs;
  final productlist = Future.value(<ProductModel>[]).obs;
  Rx<Future<List<ProductModel>>> filterProduct =
      Future.value(<ProductModel>[]).obs;
  TextEditingController searchController = TextEditingController();
  var searchQuery = ''.obs;
  bool get isProductLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType == OperationType.PRODUCT;
  @override
  void onInit() {
    filteredProductsList = productList;
    getAllGategory();
    getAllProducts();

    super.onInit();
  }

  void getAllGategory() {
    runLoadingFutureFunction(
        type: OperationType.CATEGORY,
        function: CategoryRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messagetype: MessagType.REJECTED);
          }, (r) {
            categoryList.addAll(r);
          });
        }));
  }

  Future<void> getAllProducts() async {
    runLoadingFutureFunction(
        type: OperationType.PRODUCT,
        function: ProductRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messagetype: MessagType.REJECTED);
          }, (r) {
            productList.addAll(r);
          });
        }));
  }

  // void filterList(query) {
  //   query = searchController.value.text;
  //   if (query.isNotEmpty) {
  //     var results = productList
  //         .where((product) =>
  //             product.title!.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //     filteredProductsList.assignAll(results);
  //   } else {
  //     filteredProductsList.assignAll(productList);
  //   }
  // }

  void updateSearchQuery(String query) {
    if (query.isEmpty) {
      getAllProducts();
      return;
    }
    filteredProductsList.value = productList
        .where((product) =>
            product.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    if (filteredProductsList.isEmpty) {
      CustomToast.showMessage(
        message: "",
      );
      FocusScope.of(Get.context!).unfocus();
    }
  }
  // Future<void> searchChanged(String value) async {
  //   if (value != null && value.isNotEmpty) {
  //     List<ProductModel> s = await productList.value;
  //     filterProduct = Future.value(s
  //             .where((element) =>
  //                 (element.title!.toLowerCase().contains(value.toLowerCase())))
  //             .toList())
  //         .obs;
  //   }
  //   filterProduct = productlist;
  // }

  // void updateSearchQuery(String query) {
  //   searchQuery.value = query;
  // }

  // void updateFilteredProductsList() {
  //   if (searchQuery.value.isEmpty) {
  //     filteredProductsList.assignAll(productList);
  //     return;
  //   }
  //   filteredProductsList.value = productList
  //       .where((product) => product.title!
  //           .toLowerCase()
  //           .contains(searchQuery.value.toLowerCase()))
  //       .toList();
  //   if (filteredProductsList.isEmpty) {
  //     FocusScope.of(Get.context!).unfocus();
  //     CustomToast.showMessage(message: "no product to show");
  //   }
  // }
}
