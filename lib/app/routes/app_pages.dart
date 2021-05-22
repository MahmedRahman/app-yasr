import 'package:get/get.dart';

import 'package:yasr/app/modules/AppSettings/bindings/app_settings_binding.dart';
import 'package:yasr/app/modules/AppSettings/views/aboutus_view.dart';
import 'package:yasr/app/modules/AppSettings/views/app_settings_view.dart';
import 'package:yasr/app/modules/AppSettings/views/contactus_view.dart';
import 'package:yasr/app/modules/AppSettings/views/usagepolicy_view.dart';
import 'package:yasr/app/modules/Authentication/bindings/Authentication_binding.dart';
import 'package:yasr/app/modules/Authentication/views/Authentication_view.dart';
import 'package:yasr/app/modules/Authentication/views/client_signin_view.dart';
import 'package:yasr/app/modules/Authentication/views/client_signup_view.dart';
import 'package:yasr/app/modules/Authentication/views/lawyer_signin_view.dart';
import 'package:yasr/app/modules/Authentication/views/lawyer_signup_view.dart';
import 'package:yasr/app/modules/Authentication/views/user_activate_view.dart';
import 'package:yasr/app/modules/Authentication/views/user_otp_view.dart';
import 'package:yasr/app/modules/Authentication/views/user_type_view.dart';
import 'package:yasr/app/modules/Debt/bindings/Debt_binding.dart';
import 'package:yasr/app/modules/Debt/views/Debt_view.dart';
import 'package:yasr/app/modules/Notifications/bindings/Notifications_binding.dart';
import 'package:yasr/app/modules/Notifications/views/notifications_detailes_view.dart';
import 'package:yasr/app/modules/Notifications/views/notifications_list_view.dart';
import 'package:yasr/app/modules/TechnicalSuppor/bindings/technical_suppor_binding.dart';
import 'package:yasr/app/modules/TechnicalSuppor/views/technical_suppor_detailes_view.dart';
import 'package:yasr/app/modules/TechnicalSuppor/views/technical_suppor_view.dart';
import 'package:yasr/app/modules/TechnicalSuppor/views/technical_support_create_view.dart';
import 'package:yasr/app/modules/chat/bindings/chat_binding.dart';
import 'package:yasr/app/modules/chat/views/chat_user_view.dart';
import 'package:yasr/app/modules/chat/views/chat_view.dart';
import 'package:yasr/app/modules/entry_point/bindings/entry_point_binding.dart';
import 'package:yasr/app/modules/entry_point/views/entry_point_view.dart';
import 'package:yasr/app/modules/entry_point/views/splash_view.dart';
import 'package:yasr/app/modules/home_client/bindings/Client_binding.dart';
import 'package:yasr/app/modules/home_client/views/Client_view.dart';
import 'package:yasr/app/modules/home_lawyer/bindings/lawyer_binding.dart';
import 'package:yasr/app/modules/home_lawyer/views/lawyer_view.dart';
import 'package:yasr/app/modules/order/bindings/order_binding.dart';
import 'package:yasr/app/modules/order_provider/views/lawyer_order_detail_view.dart';
import 'package:yasr/app/modules/order/views/order_add_view.dart';
import 'package:yasr/app/modules/order/views/order_confarm_view.dart';
import 'package:yasr/app/modules/order/views/order_details_view.dart';
import 'package:yasr/app/modules/order_provider/bindings/order_provider_binding.dart';
import 'package:yasr/app/modules/order_provider/views/order_provider_view.dart';
import 'package:yasr/app/modules/permissions/bindings/permissions_binding.dart';
import 'package:yasr/app/modules/permissions/views/permissions_add_view.dart';
import 'package:yasr/app/modules/permissions/views/permissions_edit_view.dart';
import 'package:yasr/app/modules/permissions/views/permissions_view.dart';

// Notifications Notifications Notifications Notifications Notifications

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ENTRY_POINT;

  static final routes = [
    GetPage(
      name: Routes.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.SplashView,
      page: () => SplashView(),
      //binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.UserTypeView,
      page: () => UserTypeView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.ClientSigninView,
      page: () => ClientSigninView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.UserOtpView,
      page: () => UserOtpView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.ClientSignupView,
      page: () => ClientSignupView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.UserActivateView,
      page: () => UserActivateView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.LawyerSigninView,
      page: () => LawyerSigninView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.LawyerSignupView,
      page: () => LawyerSignupView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.CLIENT,
      page: () => ClientView(),
      binding: ClientBinding(),
    ),
    GetPage(
      name: Routes.OrderAddView,
      page: () => OrderAddView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.OrderDetailsView,
      page: () => OrderDetailsView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.OrderConfarmView,
      page: () => OrderConfarmView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.APP_SETTINGS,
      page: () => AppSettingsView(),
      binding: AppSettingsBinding(),
    ),
    GetPage(
      name: Routes.AboutusView,
      page: () => AboutusView(),
      binding: AppSettingsBinding(),
    ),
    GetPage(
      name: Routes.ContactusView,
      page: () => ContactusView(),
      binding: AppSettingsBinding(),
    ),
    GetPage(
      name: Routes.UsagepolicyView,
      page: () => UsagepolicyView(),
      binding: AppSettingsBinding(),
    ),

    GetPage(
      name: Routes.NotificationsListView,
      page: () => NotificationsListView(),
    ),
    GetPage(
      name: Routes.NotificationsDetailesView,
      page: () => NotificationsDetailesView(),
    ),
    GetPage(
      name: Routes.TechnicalSupporView,
      page: () => TechnicalSupporView(),
      binding: TechnicalSupporBinding(),
    ),
    GetPage(
      name: Routes.TechnicalSupportCreateView,
      page: () => TechnicalSupportCreateView(),
      binding: TechnicalSupporBinding(),
    ),
    GetPage(
      name: Routes.DEBT,
      page: () => DebtView(),
      binding: DebtBinding(),
    ),
    GetPage(
      name: Routes.LAWYER,
      page: () => LawyerView(),
      binding: LawyerBinding(),
    ),
    GetPage(
      name: Routes.LawyerOrderDetailView,
      page: () => LawyerOrderDetailView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.PERMISSIONS,
      page: () => PermissionsView(),
      binding: PermissionsBinding(),
    ),
    GetPage(
      name: Routes.PermissionsAddView,
      page: () => PermissionsAddView(),
      binding: PermissionsBinding(),
    ),
    GetPage(
      name: Routes.PermissionsEditView,
      page: () => PermissionsEditView(),
      binding: PermissionsBinding(),
    ),
    GetPage(
      name: Routes.ChatView,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.ChatUserView,
      page: () => ChatUserView(),
      binding: ChatBinding(),
    ),

    GetPage(
      name: Routes.TechnicalSupporDetailesView,
      page: () => TechnicalSupporDetailesView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.ENTRY_POINT,
      page: () => EntryPointView(),
      binding: EntryPointBinding(),
    ),
    GetPage(
      name: Routes.ORDER_PROVIDER,
      page: () => OrderProviderView(),
      binding: OrderProviderBinding(),
    ),
  ];
}
