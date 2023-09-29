import 'package:flutter_application_1/core/data/model/apis/product_model.dart';
import 'package:flutter_application_1/core/data/repositories/category_repository.dart';
import 'package:flutter_application_1/core/data/repositories/product_repository.dart';
import 'package:flutter_application_1/core/enums/message_type.dart';
import 'package:flutter_application_1/core/enums/operation_type.dart';
import 'package:flutter_application_1/core/enums/request_statues.dart';
import 'package:flutter_application_1/core/services/base_controller.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class CategoryController extends BaseControoler {
  RxList<String> categoryList = <String>[].obs;
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductModel> filterproductList = <ProductModel>[].obs;
  RxString selectedCategory = "All".obs;
  bool get isCategoryLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType == OperationType.CATEGORY;
  bool get isProductLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType == OperationType.PRODUCT;
  RxInt selectedIndex = 1.obs;

  RxDouble rating = 0.0.obs;
  @override
  void onInit() {
    getAllGategory();
    getAllProducts("electronics");
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

  void getAllProducts(String category) {
    productList.clear();
    runLoadingFutureFunction(
        type: OperationType.PRODUCT,
        function: category == "All"
            ? ProductRepository().getAll().then((value) {
                value.fold((l) {
                  CustomToast.showMessage(
                      message: l, messagetype: MessagType.REJECTED);
                }, (r) {
                  productList.addAll(r);
                });
              })
            : ProductRepository()
                .getProductByCategory(category: category)
                .then((value) {
                value.fold((l) {
                  CustomToast.showMessage(
                      message: l, messagetype: MessagType.REJECTED);
                }, (r) {
                  productList.addAll(r);
                });
              }));
  }

  // Future<void> getSpecializationspByCollege(String category) async {
  //   //filteredspecializationsList.clear();
  //   if (category == "All") {
  //     filterproductList.value = productList.value;
  //   } else {
  //     filterproductList.value = productList.where((product) {
  //       return product.category == category;
  //     }).toList();
  //   }
  // }
}
