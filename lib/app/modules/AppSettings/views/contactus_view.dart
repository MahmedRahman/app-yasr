import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';


class ContactusView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تواصل معنا'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          ListTile(
            title: Text(
              'اتصل بنا',
              style: TextStyle(
                fontSize: 20,
                color: AppTheme().colorPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '+123456789',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '+123456789',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: AppTheme().colorAccent,
          ),
          ListTile(
            title: Text(
              'العنوان',
              style: TextStyle(
                fontSize: 20,
                color: AppTheme().colorPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'الرياض -المملكة العربية السعودية',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: AppTheme().colorAccent,
          ),
          ListTile(
            title: Text(
              'موقع الانترانت',
              style: TextStyle(
                fontSize: 20,
                color: AppTheme().colorPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'www.yourdomin.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: AppTheme().colorAccent,
          ),
          ListTile(
            title: Text(
              'البريد الالكتروني',
              style: TextStyle(
                fontSize: 20,
                color: AppTheme().colorPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Email@domin.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
           Divider(
            thickness: 1,
            color: AppTheme().colorAccent,
          ),
          ListTile(
            title: Text(
              'وسائل التواصل الاجتماعى',
              style: TextStyle(
                fontSize: 20,
                color: AppTheme().colorPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
             SizedBox(
                    height: 32,
                    width: 32,
                    child: Image.asset('assets/image/fb.png'),
                  ),
                  SizedBox(
                    height: 32,
                    width: 32,
                    child: Image.asset('assets/image/tw.png'),
                  ),
                  SizedBox(
                    height: 32,
                    width: 32,
                    child: Image.asset('assets/image/in.png'),
                  ),
                  SizedBox(
                    height: 32,
                    width: 32,
                    child: Image.asset('assets/image/whatup.png'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
