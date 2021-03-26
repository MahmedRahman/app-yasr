import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/debt/views/Debt_view.dart';
import 'package:yasr/app/modules/technicalsuppor/views/technical_suppor_view.dart';
import 'package:yasr/app/modules/home_lawyer/controllers/lawyer_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/services/services.dart';
import 'package:yasr/app/data/helper/AppEnumeration.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';
import 'package:yasr/app/data/component/CustemDropdownButton.dart';

class LawyerView extends GetView<LawyerController> {
  @override
  Widget build(BuildContext context) {
    var pageIndex = 0.obs;
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    SizedBox(
                      width: Get.width * .4,
                      child: Image.asset('assets/image/logo.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.ltr,
                      children: [
                        /*
                        Text(Get.find<UserServices>().getFullName()),
                        Text('-'),
                        */
                        Text(Get.find<UserServices>().getPhoneNumber()),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(color: AppTheme().colorAccent),
              ),
              ListTile(
                title: Text(
                  'Connect us'.tr,
                  style: TextStyle(fontSize: 16),
                ),
                leading: Icon(
                  Icons.phone,
                  color: AppTheme().colorPrimary,
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
                leading: Icon(
                  Icons.info,
                  color: AppTheme().colorPrimary,
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
                leading: Icon(
                  Icons.verified,
                  color: AppTheme().colorPrimary,
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
                  'PermissionsView'.tr,
                  style: TextStyle(fontSize: 16),
                ),
                leading: Icon(
                  Icons.contacts_rounded,
                  color: AppTheme().colorPrimary,
                ),
                onTap: () {
                  // Update the state of the app.
                  Get.back();
                  Get.toNamed(Routes.PERMISSIONS);

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
              selectedItemColor: Colors.black87,
              unselectedItemColor: AppTheme().colorPrimary,
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
                print(index);
                pageIndex.value = index;
              },
              currentIndex: pageIndex.value,
              elevation: 4,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }),
        appBar: AppBar(
          title: Text('Home'.tr),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifications',
              onPressed: () {
                Get.toNamed(Routes.NotificationsListView);
              },
            )
          ],
        ),
        body: Obx(() {
          return IndexedStack(
            index: pageIndex.value,
            children: [
              LawyerHomePage(),
              TechnicalSupporView(),
              DebtView(),
            ],
          );
        }));
  }
}

class LawyerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                    'طلبات منتظرة',
                    style: TextStyle(fontSize: 10, color: Colors.white),
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
                    style: TextStyle(fontSize: 10, color: Colors.white),
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
                    'طلبات حالية',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildHomePage(),
            buildHomePage(),
            buildHomePage(),
          ],
        ),
      ),
    );
  }

  Padding buildHomePage() {
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
          CustomDropdownButton(
            listDropdown: ListCity.map((e) => e['state_name'].toString()).toList(),
            listDropdownValue: ListCity.map((e) => int.parse( e['state_id'].toString())).toList(),
           
            labelDropdownButton: '',
          ),
          CustomDropdownButton(
           listDropdown: ListCity.map((e) => e['state_name'].toString()).toList(),
            listDropdownValue: ListCity.map((e) => int.parse( e['state_id'].toString())).toList(),
           
            labelDropdownButton: '',
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.toNamed(Routes.LawyerOrderDetailView);
                  },
                  title: Text('اسم الطلب'),
                  subtitle: Text('مكان الطلب مثلا الرياض'),
                  trailing: Text('10/10/2020'),
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
          )
        ],
      ),
    );
  }
}
