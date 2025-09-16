import 'package:get/get.dart';
import 'package:sytworkx_superadmin/screens/manage_company_screen/controller/manage_company_controller.dart';
import 'package:sytworkx_superadmin/screens/settings/controller/setting_controller.dart';
import 'package:sytworkx_superadmin/screens/subscription_screen/controller/subscription_controller.dart';
import '../screens/auth/controller/auth_controller.dart';
import '../screens/dashboard_screen/controller/dashboard_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => ManageCompanyController());
    Get.lazyPut(() => SubscriptionController());
  }
}
