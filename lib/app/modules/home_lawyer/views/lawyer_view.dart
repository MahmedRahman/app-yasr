import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yasr/app/modules/debt/views/Debt_view.dart';
import 'package:yasr/app/modules/home_lawyer/model/laywer_home.dart';
import 'package:yasr/app/modules/technicalsuppor/views/technical_suppor_view.dart';
import 'package:yasr/app/modules/home_lawyer/controllers/lawyer_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/services/auth.dart';
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
                      //textDirection: TextDirection.ltr,
                      children: [
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

var selectid = 0.obs;

class LawyerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 98,
          child: Container(
            color: Color(0xff22704A),
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectid.value = 0;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/order1.png',
                              width: 32,
                            ),
                            Text(
                              'طلبات منتظرة',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              color: selectid.value == 0
                                  ? Colors.white
                                  : Color(0xff22704A),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        print('object');
                        selectid.value = 1;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/order2.png',
                              width: 32,
                            ),
                            Text(
                              'طلبات حالية',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              color: selectid.value == 1
                                  ? Colors.white
                                  : Color(0xff22704A),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectid.value = 2;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/order3.png',
                              width: 32,
                            ),
                            Text(
                              'طلبات سابقة',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              color: selectid.value == 2
                                  ? Colors.white
                                  : Color(0xff22704A),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        Expanded(
          child: Obx(() {
            return buildHomePage(selectid.value);
          }),
        )
      ],
    );
  }

  Widget buildHomePage(int tabid) {
    LawyerController controller = Get.put(LawyerController());
    controller.getRequestLawer(tabid);

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
          /* 
          CustomDropdownButton(
            listDropdown:
                ListCity.map((e) => e['state_name'].toString()).toList(),
            listDropdownValue:
                ListCity.map((e) => int.parse(e['state_id'].toString()))
                    .toList(),
            labelDropdownButton: '',
          ),
          CustomDropdownButton(
            listDropdown:
                ListCity.map((e) => e['state_name'].toString()).toList(),
            listDropdownValue:
                ListCity.map((e) => int.parse(e['state_id'].toString()))
                    .toList(),
            labelDropdownButton: '',
          ),
        */
          Expanded(
            child: Obx(() {
              return FutureBuilder(
                  future: controller.allRequests(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<AllRequest> allRequests = snapshot.data;

                      return ListView(
                        children: List.generate(allRequests.length, (index) {
                          AllRequest Requests = allRequests.elementAt(index);
                          return Card(
                            child: ListTile(
                              onTap: () {
                                FocusScope.of(context).unfocus();

                                Get.toNamed(
                                  Routes.LawyerOrderDetailView,
                                  arguments: [Requests.requestedId],
                                );
                              },
                              title: Text(Requests.requestedTitle),
                              subtitle: Text(Requests.requestedState),
                              trailing: Text(
                                DateFormat('yyyy-MM-dd')
                                    .format(Requests.requestedDate)
                                    .toString(),
                              ),
                              leading: SizedBox(
                                height: 32,
                                width: 32,
                                child: Image.asset('assets/image/order.png'),
                              ),
                            ),
                          );
                        }),
                      );
                    }

                    return Center(child: CircularProgressIndicator());
                  });
            }),
          )
        ],
      ),
    );
  }
}
