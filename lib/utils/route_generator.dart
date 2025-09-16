
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sytworkx_superadmin/screens/settings/setting_screen.dart';
import 'package:sytworkx_superadmin/utils/screen_bindings.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/dashboard_screen/dashboard_screen.dart';
import '../screens/manage_company_screen/manage_company_screen.dart';
import '../screens/manage_company_screen/worker_detail_screen.dart';
import '../screens/subscription_screen/subscription_screen.dart';
import 'app_strings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(name: kAuthScreenRoute, page: () => AuthScreen(), binding: ScreenBindings(),),
      GetPage(name: kDashboardScreenRoute, page: () => DashboardScreen(), binding: ScreenBindings(),),
      GetPage(name: kSettingScreenRoute, page: () => SettingScreen(), binding: ScreenBindings(),),
      GetPage(name: kWorkerDetailsScreenRoute, page: () => WorkerDetailsScreen(), binding: ScreenBindings(),),
      GetPage(name: kManageCompanyScreenRoute, page: () => ManageCompanyScreen(), binding: ScreenBindings(),),
      GetPage(name: kSubscriptionScreenRoute, page: () => SubscriptionScreen(), binding: ScreenBindings(),),
    ];
  }
}

