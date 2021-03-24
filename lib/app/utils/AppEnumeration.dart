import 'package:flutter/cupertino.dart';

var ListTicketsTypes = [
  {"id": 1, "name": "استفسار", "color": "#f06800"},
  {"id": 2, "name": "مشكلة", "color": "#f01d28"},
  {"id": 3, "name": "اقتراح", "color": "#5e0f4c"}
];

var ListOrderClientTypes = [
  {"id": 1, "name": "فرد"},
  {"id": 2, "name": "شركة"},
];

var ListCity = [
  {"state_name": "الخليل", "state_id": 7},
  {"state_name": "الرياض", "state_id": 3},
  {"state_name": "المدينة", "state_id": 2},
  {"state_name": "مكة", "state_id": 1}
];
var ListRequest = [
  {"request_name": "قضايا التحكم الدولى", "request_id": 4},
  {"request_name": "قضايا الاحوال الشخصيه", "request_id": 3},
  {"request_name": "قضايا التعويضات", "request_id": 2},
  {"request_name": "تأسيس شركات", "request_id": 1}
];

var ListLawyerUser =       [
            {
                "lawyer_type": "محامى موكل من قبل محامى",
                "lawyer_id": 2
            },
            {
                "lawyer_type": "محامى اساسى",
                "lawyer_id": 1
            }
        ];

List<String> listTechnicalSupport = [
  'احتار نوع الطلب',
  'صياغة عقود',
  'قاضيا ميراث',
  'قاضيا تعويضات',
  'قاضيا اخرى'
];

List<String> listOrderType = [
  'احتار نوع الطلب',
  'صياغة عقود',
  'قاضيا ميراث',
  'قاضيا تعويضات',
  'قاضيا اخرى'
];

List<String> listClient = ['رجاء تحديد نوع العميل', 'فرد', 'شركة'];

enum clientType { client, lawyer }

enum lawyerType { lawyer, lawyerAgent }
