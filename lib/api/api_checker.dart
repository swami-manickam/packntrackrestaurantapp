import 'package:get/get.dart';
import 'package:packntrack_multivendor_restaurant/common/widgets/custom_snackbar_widget.dart';
import 'package:packntrack_multivendor_restaurant/features/auth/controllers/auth_controller.dart';
import 'package:packntrack_multivendor_restaurant/helper/route_helper.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      Get.find<AuthController>().clearSharedData();
      Get.offAllNamed(RouteHelper.getSignInRoute());
    } else {
      showCustomSnackBar(response.statusText);
    }
  }
}
