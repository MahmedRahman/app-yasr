import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Client/controllers/Client_controller.dart';
import 'package:yasr/app/modules/Debt/views/debt_view.dart';
import 'package:yasr/app/modules/TechnicalSuppor/bindings/technical_suppor_binding.dart';
import 'package:yasr/app/modules/TechnicalSuppor/controllers/technical_suppor_controller.dart';
import 'package:yasr/app/modules/TechnicalSuppor/views/technical_suppor_view.dart';
import 'package:yasr/app/modules/order/controllers/order_controller.dart';
import 'package:yasr/app/modules/order/model/order_model.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/services/services.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';

class ClientView extends GetView<ClientController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(TechnicalSupporController());
    //TechnicalSupporBinding();
    var pageIndex = 0.obs;
    var data = Get.arguments;

    if (data != null) {
      pageIndex.value = int.parse(data[0]);
    }
    return Scaffold(
        bottomNavigationBar: Obx(() {
          return Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 32,
                    width: 32,
                    child: Image.asset(
                      'assets/image/home-page.png',
                      color: pageIndex.value == 0
                          ? Colors.black87
                          : AppTheme().colorPrimary,
                    ),
                  ),
                  label: 'Home'.tr,
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 32,
                    width: 32,
                    child: Image.asset(
                      'assets/image/technical-support.png',
                      color: pageIndex.value == 1
                          ? Colors.black87
                          : AppTheme().colorPrimary,
                    ),
                  ),
                  label: 'Technical Suppor'.tr,
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 32,
                    width: 32,
                    child: Image.asset(
                      'assets/image/debt.png',
                      color: pageIndex.value == 2
                          ? Colors.black87
                          : AppTheme().colorPrimary,
                    ),
                  ),
                  label: 'Directorates'.tr,
                ),
              ],
              onTap: (index) {
                pageIndex.value = index;
              },
              currentIndex: pageIndex.value,
              elevation: 4,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              selectedItemColor: Colors.black87,
              unselectedItemColor: AppTheme().colorPrimary,
            ),
          );
        }),
        appBar: AppBar(
          title: Text('Home'.tr),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_active),
              tooltip: 'Notifications',
              onPressed: () {
                Get.toNamed(Routes.NotificationsListView);
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Image.asset('assets/image/logo.png'),
                    Text('data'),
                    Text('data'),
                  ],
                ),
                decoration: BoxDecoration(color: AppTheme().colorAccent),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Connect us'.tr,
                  style: TextStyle(fontSize: 16),
                ),
                leading: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('assets/image/conactus.png'),
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.ContactusView);
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(
                color: AppTheme().colorPrimary,
              ),
              ListTile(
                title: Text(
                  'About us'.tr,
                  style: TextStyle(fontSize: 16),
                ),
                leading: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('assets/image/about.png'),
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.AboutusView);
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(
                color: AppTheme().colorPrimary,
              ),
              ListTile(
                title: Text(
                  'Policy use'.tr,
                  style: TextStyle(fontSize: 16),
                ),
                leading: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('assets/image/policey.png'),
                ),
                onTap: () {
                  // Update the state of the app.
                  Get.back();
                  Get.toNamed(Routes.UsagepolicyView);

                  // ...
                },
              ),
              Divider(
                color: AppTheme().colorPrimary,
              ),
              ListTile(
                title: Text(
                  'logout'.tr,
                  style: TextStyle(fontSize: 16),
                ),
                leading: SizedBox(
                  width: 32,
                  height: 32,
                  child: Icon(
                    Icons.logout,
                    color: AppTheme().colorPrimary,
                  ),
                ),
                onTap: () {
                  // Update the state of the app.
                  Get.back();
                  Get.toNamed(Routes.UserTypeView);
                  Get.find<UserServices>().setUserRole('-1');
                  Get.find<UserServices>().setUserToken('-1');
                  // ...
                },
              )
            ],
          ),
        ),
        body: Scaffold(
          key: _scaffoldKey,
          body: Obx(() {
            return IndexedStack(
              index: pageIndex.value,
              children: [
                HomePageTab(),
                TechnicalSupporView(),
                DebtView(),
              ],
            );
          }),
        ));
  }
}

class HomePageTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Get.toNamed(Routes.OrderAddView);
        },
        child: SizedBox(
          height: 32,
          width: 32,
          child: Image.asset('assets/image/addorder.png'),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: Container(
              color: AppTheme().colorSecondary,
              child: TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    icon: SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/image/order1.png'),
                    ),
                    iconMargin: EdgeInsets.all(5),
                    child: Text(
                      'طلبات قائمة',
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ),
                  Tab(
                    icon: SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/image/order2.png'),
                    ),
                    iconMargin: EdgeInsets.all(5),
                    child: Text(
                      'طلبات سابقة',
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ),
                  Tab(
                    icon: SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/image/order4.png'),
                    ),
                    iconMargin: EdgeInsets.all(5),
                    child: Text(
                      'طلبات مرفوضة',
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ),
                  Tab(
                    icon: SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/image/order3.png'),
                    ),
                    iconMargin: EdgeInsets.all(5),
                    child: Text(
                      'طلبات قائمة',
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              HomePage(),
              HomePage(),
              HomePage(),
              HomePage(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  OrderController _orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    _orderController.getClientOrderList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1,
                ),
              ),
              hintText: 'البحث',
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(() {
            return Expanded(
              child: ListView.separated(
                itemCount: _orderController.allRequests.length,
                itemBuilder: (context, index) {
                  AllRequest request =
                      _orderController.allRequests.elementAt(index);

                  return ListTile(
                    onTap: () {
                      Get.toNamed(Routes.OrderDetailsView,
                          arguments: [request.requestedId]);
                    },
                    title: Text(request.requestedTitle),
                    subtitle: Text(request.requestedState),
                    trailing: Text(request.requestedDate.toString()),
                    leading: SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/image/order.png'),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 1,
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
