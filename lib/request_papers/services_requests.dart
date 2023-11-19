import 'package:flutter/material.dart';
import 'package:univ_port_app/request_papers/service_card.dart';

import '../app_drawer.dart';
import '../custom_appbar.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  // final String title;

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: SafeArea(
          top: true,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 7.0,
            runSpacing: 7.0,
            // direction: Axis.vertical,
            children: [
              ServiceCard(
                title: 'إختبار اللغة العربية',
                translation: 'Arabic Language Test',
                price: '1000',
              ),
              ServiceCard(
                title: 'بيان حالة',
                translation: 'Portofolio of Statement Case',
                price: '55',
              ),
              ServiceCard(
                title: 'بيان درجات',
                translation: 'Statement of Grades',
                price: '305',
              ),
              ServiceCard(
                title: 'استمارة الرقم القومي للمصرين',
                translation: 'National ID Card',
                price: '5',
              ),
              ServiceCard(
                title: 'بطاقة الجامعة',
                translation: 'University ID Card',
                price: '100',
              ),
              ServiceCard(
                title: 'شهادة القيد بالوزارة',
                translation: 'Ministry Enrollment Certificate',
                price: '205',
              ),
              ServiceCard(
                title: 'شهادة قيد السفر',
                translation: 'Travel Certificate',
                price: '205',
              ),
              ServiceCard(
                title: 'بيان حالة الوزارة',
                translation: 'Ministry Statement Case',
                price: '205',
              ),
              ServiceCard(title: 'بيان حالة داخلي', translation: 'Internal Statement Case', price: '5'),
              ServiceCard(
                title: 'محتوى علمي كلية خمس سنين',
                translation: 'Curriculum Five Years',
                price: '355',
              ),
              ServiceCard(
                title: 'إفادة مالية',
                translation: 'Financial Statement',
                price: '205',
              ),
              ServiceCard(
                title: 'حافظة تأهيل',
                translation: 'Submit Portfolio',
                price: '110',
              ),
              ServiceCard(
                title: 'خطاب حسن السير والسلوك',
                translation: 'Letter of Good Conduct',
                price: '5',
              ),
            ],
          )),
    );
  }
}
