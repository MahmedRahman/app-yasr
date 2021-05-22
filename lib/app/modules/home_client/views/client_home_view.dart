import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yasr/app/modules/order/controllers/order_controller.dart';
import 'package:yasr/app/modules/order/model/order_model.dart';
import 'package:yasr/app/routes/app_pages.dart';

class HomePage extends StatelessWidget {
  HomePage({@required this.requestid});
  int requestid;

  OrderController _orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _orderController.getClientOrderList(requestid: requestid),
        builder: (c, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
                    return _orderController.allRequests.length == 0
                        ?  Expanded(
                          child: Center(
                              child: Text('لا يوجد طلبات حاليا' ,style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                        )
                        : Expanded(
                            child: ListView.separated(
                              itemCount: _orderController.allRequests.length,
                              itemBuilder: (context, index) {
                                AllRequest request = _orderController
                                    .allRequests
                                    .elementAt(index);

                                return ListTile(
                                  onTap: () {
                                    Get.toNamed(Routes.OrderDetailsView,
                                        arguments: [request.requestedId]);
                                  },
                                  title: Text(request.requestedTitle),
                                  subtitle: Text(request.requestedState),
                                  trailing: Text(DateFormat('yyyy-MM-dd')
                                      .format(request.requestedDate)
                                      .toString()),
                                  leading: SizedBox(
                                    height: 32,
                                    width: 32,
                                    child:
                                        Image.asset('assets/image/order.png'),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
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

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
