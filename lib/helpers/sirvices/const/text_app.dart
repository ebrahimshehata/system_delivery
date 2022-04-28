import 'package:flutter/material.dart';



List<Map<dynamic, dynamic>> detailsProblemList = [
  {
    'type_sort_name': {
      'name': 'تحديد المشكلة',
      'type_sort_value': [
        'السبورات الذكية',
        'كيابل التوصيل بين الأجهزة',
        'بروجكتر',
        'سبورات ذكية',
        'أجهزة الاتصال',
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'مدى الضرر',
      'type_sort_value': [
        'عالي ',
        'متوسط',
        'ضعيف',
      ]
    },
  },
];
//**************************
Map ticketInformation = {
  'ticket_id': 'VXSQ4938',
  'ticket_date': DateTime.now(),
  'ticket_target': 'مركز الصيانة - الإدارة العامة للخدمات التعلمية',
  'ticket_status': 'معتمدة',
  'ticket_priority': 'عادية',
  'ticket_building': 'ب',
  'ticket_floor': 'الأول',
  'ticket_room_type': 'استديو',
  'ticket_room_number': '102',
  'ticket_phone_number': '0543739384',
  'ticket_problem_description': 'البروجكتر لا يعمل ',
};
//***************************
List<Map> homeScreenGridViewDepartmentManagerText = [
  {
    'page_to': '/DM_chosen_technical_Screen',
    'svg_picture': 'images/user-alt.svg',
    'text': 'تعيين الفنيين'
  },
  {
    'page_to': '/DM_tracking_report_screen',
    'svg_picture': 'images/check-square.svg',
    'text': 'متابعة البلاغات'
  },
  {
    'page_to': '/DM_achievement_of_technicians_screen',
    'svg_picture': 'images/archive.svg',
    'text': 'عرض إنجاز الفنيين'
  },
  {
    'page_to': '/conection_customer_services_screen',
    'svg_picture': 'images/contant.svg',
    'text': 'التواصل مع الإدارة العليا'
  },
  {
    'page_to': '/DM_show_reports',
    'svg_picture': 'images/download.svg',
    'text': 'تحميل التقارير'
  },
];
List<Map> homeScreenGridViewCustomerServicesText = [
  {
    'page_to': '/conection_customer_services_screen',
    'svg_picture': 'images/contant.svg',
    'text': 'التواصل مع المستفيد'
  },
  {
    'page_to': '/CS_supervise_report_screen',
    'svg_picture': 'images/check-square.svg',
    'text': 'متابعة البلاغات'
  },
  {
    'page_to': '/CS_new_report',
    'svg_picture': 'images/date-rang.svg',
    'text': 'البلاغات الجديدة'
  },

];

List<Map> homeScreenGridViewCustomerText = [
  {
    'page_to': '/select_type_conection_screen',
    'svg_picture': 'images/contant.svg',
    'text': 'التواصل مع خدمة العملاء'
  },
  {
    'page_to': '/superviser_report_screen',
    'svg_picture': 'images/check-square.svg',
    'text': 'متابعة البلاغات'
  },
  {
    'page_to': '/send_report_screen',
    'svg_picture': 'images/square-plus.svg',
    'text': 'إنشاء البلاغات الجديدة'
  },
];

List<Map> homeScreenGridViewTechnicalText = [
  {
    'page_to': '/T_achivement_screen',
    'svg_picture': 'images/archive.svg',
    'text': 'عرض الإنجازات'
  },
  {
    'page_to': '/T_superviser_screen',
    'svg_picture': 'images/check-square.svg',
    'text': 'متابعة البلاغات'
  },
  {
    'page_to': '/T_show_tasks_screen',
    'svg_picture': 'images/date-rang.svg',
    'text': 'عرض المهام'
  },
];

List<Map> homeScreenGridViewHigherManagementText = [
  {
    'page_to': '/HM_complaints_and_suggestions_screen',
    'svg_picture': 'images/complaint.svg',
    'text': 'الشكاوي والاقتراحات'
  },

  {
    'page_to': '/HM_report_late',
    'svg_picture': 'images/report_late.svg',
    'text': 'البلاغات المتأخرة'
  },
  {
    'page_to': '/HM_statistic_screen',
    'svg_picture': 'images/chart.svg',
    'text': 'احصائيات التذاكر'
  },
  {
    'page_to': '/conection_customer_services_screen',
    'svg_picture': 'images/contant.svg',
    'text': 'التواصل مع رئيس القسم'
  },
];
//*******************************
List<Map<dynamic, dynamic>> statusSort = [
  {
    'type_sort_name': {
      'name': 'فرز على حسب الحالة',
      'type_sort_value': [
        statusReport[0]['name'][0],
        statusReport[1]['name'][0],
        statusReport[2]['name'][0],
        statusReport[3]['name'][0],
        statusReport[4]['name'][0],
        statusReport[5]['name'][0],
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب الجهة',
      'type_sort_value': [
        'الإدارة العليا',
        'المستفيد',
        'خدمة العملاء',
        'مدير القسم',
        'الفنيين',
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب المقر',
      'type_sort_value': [
        'العابدية -طلاب',
        'الزاهر -طالبات',
        'العابدية  طالبات',
        'الكلية الجامعية -العزيزية',
        'مقر الطالبات بالعزيزية',
        'مقر الطالبات بريع ذاخر',
        'الكلية الجامعية بالقنفذة -طلاب',
        'الكلية الجامعية بالقنفذة -طالبات',
        'الكلية الجامعية بالليث -طلاب',
        'الكلية الجامعية بالليث -طالبات',
        'الصحة العامة والمعلوماتية الصحية',
        'الصحية طالبات مكة',
        'السنة التاهيلية -الششة طالبات',
        'طلاب بريدة',
        'طالبات بريدة',
        'السنة التحضيرية طالبات -الششة',
        'الهندسة بالقنفذة -طلاب',
        'الهندسة بالليث -طلاب',
        'الحاسب الالي بالليث-طلاب',
        'الحاسب الالي بالقنفذة -طلاب',
        'الكلية الصحية بالليث-طلاب',
        'الكلية الصحية بالليث -طالبات',
        'الكلية الجامعية -الجموم طلاب',
        'جموم -طلاب',
        'جموم-طالبات',
        'القنفذة -طلاب',
        'القنفذة -طالبات',
        'العزيزية -طالبات',
        'الصحية طلاب بالقنفذة',
        'كلية الطب بالقنفذة',
        'كلية الحاسب الالي-قنفذة-طالبات',
      ]
    },
  },
];

List<Map> statusReport = [
  {
    'name': ['معتمدة', Color(0xffF99806)]
  },
  {
    'name': ['تحت الإجراء', Color(0xff28A2CF)]
  },
  {
    'name': ['معلقة', Color(0xff818181)]
  },
  {
    'name': ['مغلقة', Color(0xffDF0D0D)]
  },
  {
    'name': ['جديدة', Color(0xffBFBFBF)]
  },
  {
    'name': ['مرفوضة', Color(0xff000000)]
  },
];

List<Map<dynamic, dynamic>> allreports = [
  {
    'report_num': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_sender': 'الإدارة العامة للخدمات التعلمية',
    'report_position': 'العابدية - طالبات',
    'reporter_name': 'عبدالعزيز الأحمدي',
    'report_status': 'معتمدة'
  },
  {
    'report_num': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_sender': 'الإدارة العامة للخدمات التعلمية',
    'report_position': 'العابدية - طالبات',
    'reporter_name': 'عبدالعزيز الأحمدي',
    'report_status': 'تحت الإجراء'
  },
  {
    'report_num': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_sender': 'الإدارة العامة للخدمات التعلمية',
    'report_position': 'العابدية - طالبات',
    'reporter_name': 'عبدالعزيز الأحمدي',
    'report_status': 'معلقة'
  },
  {
    'report_num': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_sender': 'الإدارة العامة للخدمات التعلمية',
    'report_position': 'العابدية - طالبات',
    'reporter_name': 'عبدالعزيز الأحمدي',
    'report_status': 'مغلقة'
  },
  {
    'report_num': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_sender': 'الإدارة العامة للخدمات التعلمية',
    'report_position': 'العابدية - طالبات',
    'reporter_name': 'عبدالعزيز الأحمدي',
    'report_status': 'جديدة'
  },
  {
    'report_num': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_sender': 'الإدارة العامة للخدمات التعلمية',
    'report_position': 'العابدية - طالبات',
    'reporter_name': 'عبدالعزيز الأحمدي',
    'report_status': 'مرفوضة'
  },
];
//**********************
List<String> howCanReplay = [
  'الكل',
  'خدمة العملاء',
  'رئيس القسم',
  'الفنيين',
];

/*List<Ticket> ticketsStatitics = [
  Ticket(
      numAllTicket: 100,
      numClosedTicket: 50,
      numLateTicket: 30,
      numCombinations: 3,
      numRemoval: 2,
      numPendingTicket: 10,
      numProcedureTicket: 22,
      numNotMaintenanceSection: 35,
      numChanges: 4,
      numMaintenance: 15
  )
];


List<UserTicket> userTicket = [
  UserTicket(
      numAllTicket: 40,
      numClosedTicket: 25,
      numLateTicket: 15,
      visitedInMonth: 17,
      numPendingTicket: 20,
      numAcceptableTicket: 35,
      numProcedureTicket: 30

  ),
];*/

//**************
List<Map<dynamic, dynamic>> showReportsList = [
  {
    'type_sort_name': {
      'name': 'اختيار الشهر',
      'type_sort_value': [
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        '10',
        '11',
        '12',
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'اختيار المقر',
      'type_sort_value': [
        'العابدية -طلاب',
        'الزاهر -طالبات',
        'العابدية  طالبات',
        'الكلية الجامعية -العزيزية',
        'مقر الطالبات بالعزيزية',
        'مقر الطالبات بريع ذاخر',
        'الكلية الجامعية بالقنفذة -طلاب',
        'الكلية الجامعية بالقنفذة -طالبات',
        'الكلية الجامعية بالليث -طلاب',
        'الكلية الجامعية بالليث -طالبات',
        'الصحة العامة والمعلوماتية الصحية',
        'الصحية طالبات مكة',
        'السنة التاهيلية -الششة طالبات',
        'طلاب بريدة',
        'طالبات بريدة',
        'السنة التحضيرية طالبات -الششة',
        'الهندسة بالقنفذة -طلاب',
        'الهندسة بالليث -طلاب',
        'الحاسب الالي بالليث-طلاب',
        'الحاسب الالي بالقنفذة -طلاب',
        'الكلية الصحية بالليث-طلاب',
        'الكلية الصحية بالليث -طالبات',
        'الكلية الجامعية -الجموم طلاب',
        'جموم -طلاب',
        'جموم-طالبات',
        'القنفذة -طلاب',
        'القنفذة -طالبات',
        'العزيزية -طالبات',
        'الصحية طلاب بالقنفذة',
        'كلية الطب بالقنفذة',
        'كلية الحاسب الالي-قنفذة-طالبات',
      ]
    },
  },
];
//*******************
    Map reportInformation = {
    'ticket_id': 'VXSQ4938',
    'ticket_date': DateTime.now(),
    'ticket_description': 'سلك جهاز العرض مقطوع',
    'room_number': '102',
    'room_type': 'استديو',
    'ticket_building': 'ب',
    'ticket_problem_description': 'البروجكتر لا يعمل',
    'report_ticnicals': [
      'عبد العزيز الأحمدي',
      'محمد الحربي',
      'عبدالله القحطاني'
    ]
    };
    //*******************
List<Map<dynamic, dynamic>> statusSortDM = [
  {
    'type_sort_name': {
      'name': 'فرز على حسب الحالة',
      'type_sort_value': [
        statusReport[0]['name'][0],
        statusReport[1]['name'][0],
        statusReport[2]['name'][0],
        statusReport[3]['name'][0],
        statusReport[5]['name'][0],
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب الحركة',
      'type_sort_value': [
        'تم الإنجاز',
        'لم يتم الإنجاز',
        'معاينة',
        'استبدال',
        'تركيب',
        'ازالة /فك',
        'إحالة التذكرة لمركز الصيانة',
        'إحالة التذكرة لخدمة العملاء',
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب الجهة',
      'type_sort_value': [
        'الإدارة العليا',
        'المستفيد',
        'خدمة العملاء',
        'مدير القسم',
        'الفنيين',
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب المقر',
      'type_sort_value': [
        'العابدية -طلاب',
        'الزاهر -طالبات',
        'العابدية  طالبات',
        'الكلية الجامعية -العزيزية',
        'مقر الطالبات بالعزيزية',
        'مقر الطالبات بريع ذاخر',
        'الكلية الجامعية بالقنفذة -طلاب',
        'الكلية الجامعية بالقنفذة -طالبات',
        'الكلية الجامعية بالليث -طلاب',
        'الكلية الجامعية بالليث -طالبات',
        'الصحة العامة والمعلوماتية الصحية',
        'الصحية طالبات مكة',
        'السنة التاهيلية -الششة طالبات',
        'طلاب بريدة',
        'طالبات بريدة',
        'السنة التحضيرية طالبات -الششة',
        'الهندسة بالقنفذة -طلاب',
        'الهندسة بالليث -طلاب',
        'الحاسب الالي بالليث-طلاب',
        'الحاسب الالي بالقنفذة -طلاب',
        'الكلية الصحية بالليث-طلاب',
        'الكلية الصحية بالليث -طالبات',
        'الكلية الجامعية -الجموم طلاب',
        'جموم -طلاب',
        'جموم-طالبات',
        'القنفذة -طلاب',
        'القنفذة -طالبات',
        'العزيزية -طالبات',
        'الصحية طلاب بالقنفذة',
        'كلية الطب بالقنفذة',
        'كلية الحاسب الالي-قنفذة-طالبات',
      ]
    },
  },
];

List<Map<dynamic, dynamic>> statusSortT = [
  {
    'type_sort_name': {
      'name': 'فرز على حسب الحالة',
      'type_sort_value': [
        statusReport[0]['name'][0],
        statusReport[1]['name'][0],
        statusReport[2]['name'][0],
        statusReport[3]['name'][0],
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب الحركة',
      'type_sort_value': [
        'تم الإنجاز',
        'لم يتم الإنجاز',
        'معاينة',
        'استبدال',
        'تركيب',
        'ازالة /فك',
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب الجهة',
      'type_sort_value': [
        'الإدارة العليا',
        'المستفيد',
        'خدمة العملاء',
        'مدير القسم',
        'الفنيين',
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب المقر',
      'type_sort_value': [
        'العابدية -طلاب',
        'الزاهر -طالبات',
        'العابدية  طالبات',
        'الكلية الجامعية -العزيزية',
        'مقر الطالبات بالعزيزية',
        'مقر الطالبات بريع ذاخر',
        'الكلية الجامعية بالقنفذة -طلاب',
        'الكلية الجامعية بالقنفذة -طالبات',
        'الكلية الجامعية بالليث -طلاب',
        'الكلية الجامعية بالليث -طالبات',
        'الصحة العامة والمعلوماتية الصحية',
        'الصحية طالبات مكة',
        'السنة التاهيلية -الششة طالبات',
        'طلاب بريدة',
        'طالبات بريدة',
        'السنة التحضيرية طالبات -الششة',
        'الهندسة بالقنفذة -طلاب',
        'الهندسة بالليث -طلاب',
        'الحاسب الالي بالليث-طلاب',
        'الحاسب الالي بالقنفذة -طلاب',
        'الكلية الصحية بالليث-طلاب',
        'الكلية الصحية بالليث -طالبات',
        'الكلية الجامعية -الجموم طلاب',
        'جموم -طلاب',
        'جموم-طالبات',
        'القنفذة -طلاب',
        'القنفذة -طالبات',
        'العزيزية -طالبات',
        'الصحية طلاب بالقنفذة',
        'كلية الطب بالقنفذة',
        'كلية الحاسب الالي-قنفذة-طالبات',
      ]
    },
  },
];
///***********************
List<Map<dynamic, dynamic>> allreportsDM = [
  {
    'report_title': 'إحالة إلى مركز الصيانة',
    'report_num': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_sender': 'الإدارة العامة للخدمات التعلمية',
    'report_position': 'العابدية - طالبات',
    'reporter_name': 'عبدالعزيز الأحمدي',
    'reporter_helper': [
      'عبدالله القحطاني',
      'محمد الحربي',
    ],
    'report_status': 'معتمدة'
  },
  {
    'report_title': 'معاينة',
    'report_num': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_sender': 'الإدارة العامة للخدمات التعلمية',
    'report_position': 'العابدية - طالبات',
    'reporter_name': 'عبدالعزيز الأحمدي',
    'reporter_helper': [
      'عبدالله القحطاني',
      'محمد الحربي',
    ],
    'report_status': 'تحت الإجراء'
  },
  {
    'report_title': 'إحالة إلى مركز الصيانة',
    'report_num': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_sender': 'الإدارة العامة للخدمات التعلمية',
    'report_position': 'العابدية - طالبات',
    'reporter_name': 'عبدالعزيز الأحمدي',
    'reporter_helper': [
      'عبدالله القحطاني',
      'محمد الحربي',
    ],
    'report_status': 'معلقة'
  },
  {
    'report_title': 'إحالة إلى مركز الصيانة',
    'report_num': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_sender': 'الإدارة العامة للخدمات التعلمية',
    'report_position': 'العابدية - طالبات',
    'reporter_name': 'عبدالعزيز الأحمدي',
    'reporter_helper': [
      'عبدالله القحطاني',
      'محمد الحربي',
    ],
    'report_status': 'مغلقة'
  },
  {
    'report_title': 'إحالة إلى مركز الصيانة',
    'report_num': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_sender': 'الإدارة العامة للخدمات التعلمية',
    'report_position': 'العابدية - طالبات',
    'reporter_name': 'عبدالعزيز الأحمدي',
    'reporter_helper': [
      'عبدالله القحطاني',
      'محمد الحربي',
    ],
    'report_status': 'جديدة'
  }
];
//**************************
Map ticketInformationDM = {
  'ticket_id': 'VXSQ4938',
  'ticket_date': DateTime.now(),
  'ticket_target': 'مركز الصيانة - الإدارة العامة للخدمات التعلمية',
  'ticket_position' : 'الجموم - طالبات',
  'ticket_room_number': '102',
  'ticket_building': 'ب',
  'ticket_floor': 'الأول',
  'ticket_status': 'معتمدة',
  'ticket_phone_number': '0543739384',
  'ticket_problem_description': 'البروجكتر لا يعمل ',
  'reporter_name': 'عبدالعزيز الأحمدي',
  'reporter_helper': [
    'عبدالله القحطاني',
    'محمد الحربي',
  ],
  'ticket_date_finish_from' : DateTime.now(),
  'ticket_date_finish_to' : DateTime(2023),
};
//*************
Map ticketCompositionAndChangesInformationDM = {
  'ticket_id': 'VXSQ4938',
  'ticket_date': DateTime.now(),
  'ticket_target': 'مركز الصيانة - الإدارة العامة للخدمات التعلمية',
  'ticket_position' : 'الجموم - طالبات',
  'ticket_room_number': '102',
  'ticket_building': 'ب',
  'ticket_floor': 'الأول',
  'ticket_status': 'معتمدة',
  'ticket_phone_number': '0543739384',
  'device_name': 'بروجكتر',
  'device_type': 'جهاز عرض',
  'device_serial_number': 'PR3003412SA',
  'ticket_problem_description': 'البروجكتر لا يعمل ',
  'reporter_name': 'عبدالعزيز الأحمدي',
  'reporter_helper': [
    'عبدالله القحطاني',
    'محمد الحربي',
  ],
  'ticket_date_finish_from' : DateTime.now(),
  'ticket_date_finish_to' : DateTime(2023),
};
//**************
List<Map<dynamic, dynamic>> allTicketReportsDM = [
  {
    'report_num': '[ VXSQ4938 ] ',
    'report_date_time': DateTime.now(),
    'report_title': 'إحالة إلى مركز الصيانة',
    'report_status': 'معتمدة',
    'report_description': 'تمت المعاينة واتضح الخطا في نموذج الإجابة',
    'reporter_name': 'عبدالله الزهراني',
  },
  {
    'report_num': '[ VXSQ4938 ] ',
    'report_date_time': DateTime.now(),
    'report_title': 'إزالة',
    'report_status': 'تحت الإجراء',
    'report_description': 'تم إزالة البروجكتر',
    'reporter_name': 'عبدالله الزهراني',
  },
  {
    'report_num': '[ VXSQ4938 ] ',
    'report_date_time': DateTime.now(),
    'report_title': 'إحالة لقسم الصيانة',
    'report_status': 'جديدة',
    'report_description': 'لا يوجد ',
    'reporter_name': 'عبدالله الزهراني',
  },
  {
    'report_num': '[ VXSQ4938 ] ',
    'report_date_time': DateTime.now(),
    'report_title': 'تم الإنجاز',
    'report_status': 'مغلقة',
    'report_description': 'تم حل المشكلة بنجاح',
    'reporter_name': 'عبدالله الزهراني',
  },
];//**************
List<Map<dynamic, dynamic>> allTicketReportsLogDM = [
  {
    'device_name': 'بروجكتر',
    'device_type': 's432r32k',
    'device_serial_number': 'PR3003412SA',
    'report_date_time': DateTime.now(),
    'report_status': 'معتمدة',
    'report_description': 'انقطع سلك ال اتش دي',
  },
  {
    'device_name': 'Test',
    'device_type': 'textaskm',
    'device_serial_number': 'ERP099acA',
    'report_date_time': DateTime.now(),
    'report_status': 'مغلقة',
    'report_description': 'انقطع سلك ال اتش دي',
  },
];
/////********************
List<Map<dynamic, dynamic>> allTicketChangesAndCombinationsLogDM = [
  {
    'report_title': 'صيانة',
    'report_date_time': DateTime.now(),
    'report_status': 'معتمدة',
    'report_description': 'انقطع سلك ال اتش دي',
  },
  {
    'report_title': 'تركيب',
    'report_date_time': DateTime.now(),
    'report_status': 'مغلقة',
    'report_description': 'انقطع سلك ال اتش دي',
  },
];
//********************
List<Map<dynamic, dynamic>> chosenTechnicalSortDM = [
  {
    'type_sort_name': {
      'name': 'فرز على حسب الجهة',
      'type_sort_value': [
        'الإدارة العليا',
        'المستفيد',
        'خدمة العملاء',
        'مدير القسم',
        'الفنيين',
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب المقر',
      'type_sort_value': [
        'العابدية -طلاب',
        'الزاهر -طالبات',
        'العابدية  طالبات',
        'الكلية الجامعية -العزيزية',
        'مقر الطالبات بالعزيزية',
        'مقر الطالبات بريع ذاخر',
        'الكلية الجامعية بالقنفذة -طلاب',
        'الكلية الجامعية بالقنفذة -طالبات',
        'الكلية الجامعية بالليث -طلاب',
        'الكلية الجامعية بالليث -طالبات',
        'الصحة العامة والمعلوماتية الصحية',
        'الصحية طالبات مكة',
        'السنة التاهيلية -الششة طالبات',
        'طلاب بريدة',
        'طالبات بريدة',
        'السنة التحضيرية طالبات -الششة',
        'الهندسة بالقنفذة -طلاب',
        'الهندسة بالليث -طلاب',
        'الحاسب الالي بالليث-طلاب',
        'الحاسب الالي بالقنفذة -طلاب',
        'الكلية الصحية بالليث-طلاب',
        'الكلية الصحية بالليث -طالبات',
        'الكلية الجامعية -الجموم طلاب',
        'جموم -طلاب',
        'جموم-طالبات',
        'القنفذة -طلاب',
        'القنفذة -طالبات',
        'العزيزية -طالبات',
        'الصحية طلاب بالقنفذة',
        'كلية الطب بالقنفذة',
        'كلية الحاسب الالي-قنفذة-طالبات',
      ]
    },
  },
];

List<Map> ticketSelectionTechnical = [
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_target': 'الإدارة العامة للخدمات التعلمية',
    'report_position' : 'العابدية - طالبات',
    'report_status': true,
    'ticket_room_number': '102',
    'ticket_building': 'ب',
    'ticket_floor': 'الأول',
    'ticket_status': 'تم تعيين فني',
    'ticket_phone_number': '0543739384',
    'ticket_problem_description': 'البروجكتر لا يعمل ',
    'technical_name':'عبدالله القحطاني',
    'helper_technical_name':'محمد أحمد',
  },
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_target': 'الإدارة العامة للخدمات التعلمية',
    'report_position' : 'العابدية - طالبات',
    'report_status': false,
    'ticket_room_number': '102',
    'ticket_building': 'ب',
    'ticket_floor': 'الأول',
    'ticket_status': 'جديدة',
    'ticket_phone_number': '0543739384',
    'ticket_problem_description': 'البروجكتر لا يعمل ',
  },
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_target': 'الإدارة العامة للخدمات التعلمية',
    'report_position' : 'العابدية - طالبات',
    'report_status': false,
    'ticket_room_number': '102',
    'ticket_building': 'ب',
    'ticket_floor': 'الأول',
    'ticket_status': 'جديدة',
    'ticket_phone_number': '0543739384',
    'ticket_problem_description': 'البروجكتر لا يعمل ',
  },
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_target': 'الإدارة العامة للخدمات التعلمية',
    'report_position' : 'العابدية - طالبات',
    'report_status': false,
    'ticket_room_number': '102',
    'ticket_building': 'ب',
    'ticket_floor': 'الأول',
    'ticket_status': 'جديدة',
    'ticket_phone_number': '0543739384',
    'ticket_problem_description': 'البروجكتر لا يعمل ',
  },
];
//*********************
List<Map> ticketForCustomerServices = [
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_target': 'الإدارة العامة للخدمات التعلمية',
    'report_position' : 'العابدية - طالبات',
    'reporter_name':'عبدالله القحطاني',
    'report_status': 'جديدة'
  },
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_target': 'الإدارة العامة للخدمات التعلمية',
    'report_position' : 'العابدية - طالبات',
    'reporter_name':'عبدالله القحطاني',
    'report_status': 'جديدة'
  },
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_target': 'الإدارة العامة للخدمات التعلمية',
    'report_position' : 'العابدية - طالبات',
    'reporter_name':'عبدالله القحطاني',
    'report_status': 'جديدة'
  },
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_target': 'الإدارة العامة للخدمات التعلمية',
    'report_position' : 'العابدية - طالبات',
    'reporter_name':'عبدالله القحطاني',
    'report_status': 'جديدة'
  },
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_target': 'الإدارة العامة للخدمات التعلمية',
    'report_position' : 'العابدية - طالبات',
    'reporter_name':'عبدالله القحطاني',
    'report_status': 'جديدة'
  },
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_target': 'الإدارة العامة للخدمات التعلمية',
    'report_position' : 'العابدية - طالبات',
    'reporter_name':'عبدالله القحطاني',
    'report_status': 'جديدة'
  },
];
//*******************
List<Map> detailsTicketCustomerServices = [
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'report_target': 'مركز الصيانة - الإدارة العامة للخدمات التعلمية',
    'report_status':'جديدة',
    'status_important':'عادية',
    'ticket_building': 'ب',
    'ticket_floor': 'الأول',
    'ticket_room_type': 'استديو',
    'ticket_room_number': '102',
    'ticket_phone_number': '0543739384',
    'ticket_problem_description': 'البروجكتر لا يعمل ',
  }
];
//**************************
List<Map> logTicketCustomerServices = [
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'type_des': 'إحالة إلى قسم الصيانة',
    'reporter_name': 'عبد الله الزهراني',
    'color': Colors.grey,
  },
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'type_des': 'معاينة',
    'ticket_problem_description': 'تمت المعاينة واتضح الخطا في نموذج الإجابة',
    'reporter_name': 'عبد الله الزهراني',
    'color': Colors.orange,
  },
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'type_des': 'إزالة',
    'device_name' : 'بروجكتر',
    'device_type' : 'جهاز عرض',
    'device_serial_number' : 'PR3003412SA',
    'ticket_problem_description': 'تم إزالة البروجكتر',
    'reporter_name': 'عبد الله الزهراني',
    'color': Colors.blue,
  },
  {
    'report_number': 'EIRK744',
    'report_date_time': DateTime.now(),
    'type_des': 'تم الإنجاز',
    'ticket_problem_description': 'تم حل المشكلة بنجاح',
    'reporter_name': 'عبد الله الزهراني',
    'color': Colors.red,
  },
];
//*********************
List<Map<dynamic, dynamic>> statusSortTechnical = [
  {
    'type_sort_name': {
      'name': 'فرز على حسب الجهة',
      'type_sort_value': [
        'الإدارة العليا',
        'المستفيد',
        'خدمة العملاء',
        'مدير القسم',
        'الفنيين',
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب المقر',
      'type_sort_value': [
        'العابدية -طلاب',
        'الزاهر -طالبات',
        'العابدية  طالبات',
        'الكلية الجامعية -العزيزية',
        'مقر الطالبات بالعزيزية',
        'مقر الطالبات بريع ذاخر',
        'الكلية الجامعية بالقنفذة -طلاب',
        'الكلية الجامعية بالقنفذة -طالبات',
        'الكلية الجامعية بالليث -طلاب',
        'الكلية الجامعية بالليث -طالبات',
        'الصحة العامة والمعلوماتية الصحية',
        'الصحية طالبات مكة',
        'السنة التاهيلية -الششة طالبات',
        'طلاب بريدة',
        'طالبات بريدة',
        'السنة التحضيرية طالبات -الششة',
        'الهندسة بالقنفذة -طلاب',
        'الهندسة بالليث -طلاب',
        'الحاسب الالي بالليث-طلاب',
        'الحاسب الالي بالقنفذة -طلاب',
        'الكلية الصحية بالليث-طلاب',
        'الكلية الصحية بالليث -طالبات',
        'الكلية الجامعية -الجموم طلاب',
        'جموم -طلاب',
        'جموم-طالبات',
        'القنفذة -طلاب',
        'القنفذة -طالبات',
        'العزيزية -طالبات',
        'الصحية طلاب بالقنفذة',
        'كلية الطب بالقنفذة',
        'كلية الحاسب الالي-قنفذة-طالبات',
      ]
    },
  },
];
//*********************
List<Map<dynamic, dynamic>> allreportsTechnical = [
  {
    'report_target':'إحالة إلى مركز الصيانة',
    'report_date':DateTime.now(),
    'report_status': 'جديدة',
    'report_number': 'EIRK744',
    'report_done_from':DateTime.now(),
    'report_done_to':DateTime.utc(2022,5,15),
    'report_direction': 'الإدارة العامة للخدمات التعلمية',
    'report_position':'العابدية - طالبات',
    'technical_name':'عبدالله القحطاني',
    'helper_technical_name':'محمد أحمد',

  },
  {
    'report_target':'إحالة إلى مركز الصيانة',
    'report_date':DateTime.now(),
    'report_status': 'جديدة',
    'report_number': 'EIRK744',
    'report_done_from':DateTime.now(),
    'report_done_to':DateTime.utc(2022,5,15),
    'report_direction': 'الإدارة العامة للخدمات التعلمية',
    'report_position':'العابدية - طالبات',
    'technical_name':'عبدالله القحطاني',
    'helper_technical_name':'محمد أحمد',

  },
  {
    'report_target':'إحالة إلى مركز الصيانة',
    'report_date':DateTime.now(),
    'report_status': 'جديدة',
    'report_number': 'EIRK744',
    'report_done_from':DateTime.now(),
    'report_done_to':DateTime.utc(2022,5,15),
    'report_direction': 'الإدارة العامة للخدمات التعلمية',
    'report_position':'العابدية - طالبات',
    'technical_name':'عبدالله القحطاني',
    'helper_technical_name':'محمد أحمد',

  },
  {
    'report_target':'إحالة إلى مركز الصيانة',
    'report_date':DateTime.now(),
    'report_status': 'جديدة',
    'report_number': 'EIRK744',
    'report_done_from':DateTime.now(),
    'report_done_to':DateTime.utc(2022,5,15),
    'report_direction': 'الإدارة العامة للخدمات التعلمية',
    'report_position':'العابدية - طالبات',
    'technical_name':'عبدالله القحطاني',
    'helper_technical_name':'محمد أحمد',

  },
  {
    'report_target':'إحالة إلى مركز الصيانة',
    'report_date':DateTime.now(),
    'report_status': 'جديدة',
    'report_number': 'EIRK744',
    'report_done_from':DateTime.now(),
    'report_done_to':DateTime.utc(2022,5,15),
    'report_direction': 'الإدارة العامة للخدمات التعلمية',
    'report_position':'العابدية - طالبات',
    'technical_name':'عبدالله القحطاني',
    'helper_technical_name':'محمد أحمد',

  },
  {
    'report_target':'إحالة إلى مركز الصيانة',
    'report_date':DateTime.now(),
    'report_status': 'جديدة',
    'report_number': 'EIRK744',
    'report_done_from':DateTime.now(),
    'report_done_to':DateTime.utc(2022,5,15),
    'report_direction': 'الإدارة العامة للخدمات التعلمية',
    'report_position':'العابدية - طالبات',
    'technical_name':'عبدالله القحطاني',
    'helper_technical_name':'محمد أحمد',

  },
  {
    'report_target':'إحالة إلى مركز الصيانة',
    'report_date':DateTime.now(),
    'report_status': 'جديدة',
    'report_number': 'EIRK744',
    'report_done_from':DateTime.now(),
    'report_done_to':DateTime.utc(2022,5,15),
    'report_direction': 'الإدارة العامة للخدمات التعلمية',
    'report_position':'العابدية - طالبات',
    'technical_name':'عبدالله القحطاني',
    'helper_technical_name':'محمد أحمد',

  },
  {
    'report_target':'إحالة إلى مركز الصيانة',
    'report_date':DateTime.now(),
    'report_status': 'جديدة',
    'report_number': 'EIRK744',
    'report_done_from':DateTime.now(),
    'report_done_to':DateTime.utc(2022,5,15),
    'report_direction': 'الإدارة العامة للخدمات التعلمية',
    'report_position':'العابدية - طالبات',
    'technical_name':'عبدالله القحطاني',
    'helper_technical_name':'محمد أحمد',

  },
  {
    'report_target':'إحالة إلى مركز الصيانة',
    'report_date':DateTime.now(),
    'report_status': 'جديدة',
    'report_number': 'EIRK744',
    'report_done_from':DateTime.now(),
    'report_done_to':DateTime.utc(2022,5,15),
    'report_direction': 'الإدارة العامة للخدمات التعلمية',
    'report_position':'العابدية - طالبات',
    'technical_name':'عبدالله القحطاني',
    'helper_technical_name':'محمد أحمد',

  },
  {
    'report_target':'إحالة إلى مركز الصيانة',
    'report_date':DateTime.now(),
    'report_status': 'جديدة',
    'report_number': 'EIRK744',
    'report_done_from':DateTime.now(),
    'report_done_to':DateTime.utc(2022,5,15),
    'report_direction': 'الإدارة العامة للخدمات التعلمية',
    'report_position':'العابدية - طالبات',
    'technical_name':'عبدالله القحطاني',
    'helper_technical_name':'محمد أحمد',

  },
];

Map mapDetailsT =  {
  'report_number': 'EIRK744',
  'report_date_time': DateTime.now(),
  'report_target': 'مركز الصيانة - الإدارة العامة للخدمات التعلمية',
  'report_position' : 'الجموم - طالبات',
  'report_status': 'جديدة',
  'ticket_room_number': '102',
  'ticket_building': 'ب',
  'ticket_floor': 'الأول',
  'ticket_status': 'تم تعيين فني',
  'ticket_phone_number': '0543739384',
  'ticket_problem_description': 'البروجكتر لا يعمل ',
  'technical_name':'عبدالله القحطاني',
  'helper_technical_name':'محمد أحمد',
  'report_done_from':DateTime.now(),
  'report_done_to':DateTime.utc(2022,5,15),
};
//*************************
List<String> typeMoveTechnical = [
  'تم الإنجاز',
  'لم يتم الإنجاز',
  'معاينة',
  'إضافة تركيبات وتبديلات',
  'ازالة /فك',
];

//------------------
const String  urlUniversity = 'https://uqu.edu.sa/Sso/Password';
//------------------
Map<String,bool> howCanShowReplay = {
  'الكل':false,
  'خدمة العملاء':false,
  'رئيس القسم':false,
  'الفنيين':false,
};
//------------------
List<Map<dynamic, dynamic>> statusSortHM = [
  {
    'type_sort_name': {
      'name': 'فرز على حسب الحالة',
      'type_sort_value': [
       'المعلقة',
       'المتأخرة',
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب الجهة',
      'type_sort_value': [
        'الإدارة العليا',
        'المستفيد',
        'خدمة العملاء',
        'مدير القسم',
        'الفنيين',
      ]
    },
  },
  {
    'type_sort_name': {
      'name': 'فرز على حسب المقر',
      'type_sort_value': [
        'العابدية -طلاب',
        'الزاهر -طالبات',
        'العابدية  طالبات',
        'الكلية الجامعية -العزيزية',
        'مقر الطالبات بالعزيزية',
        'مقر الطالبات بريع ذاخر',
        'الكلية الجامعية بالقنفذة -طلاب',
        'الكلية الجامعية بالقنفذة -طالبات',
        'الكلية الجامعية بالليث -طلاب',
        'الكلية الجامعية بالليث -طالبات',
        'الصحة العامة والمعلوماتية الصحية',
        'الصحية طالبات مكة',
        'السنة التاهيلية -الششة طالبات',
        'طلاب بريدة',
        'طالبات بريدة',
        'السنة التحضيرية طالبات -الششة',
        'الهندسة بالقنفذة -طلاب',
        'الهندسة بالليث -طلاب',
        'الحاسب الالي بالليث-طلاب',
        'الحاسب الالي بالقنفذة -طلاب',
        'الكلية الصحية بالليث-طلاب',
        'الكلية الصحية بالليث -طالبات',
        'الكلية الجامعية -الجموم طلاب',
        'جموم -طلاب',
        'جموم-طالبات',
        'القنفذة -طلاب',
        'القنفذة -طالبات',
        'العزيزية -طالبات',
        'الصحية طلاب بالقنفذة',
        'كلية الطب بالقنفذة',
        'كلية الحاسب الالي-قنفذة-طالبات',
      ]
    },
  },
];