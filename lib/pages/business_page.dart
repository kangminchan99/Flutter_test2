import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/model/business_model.dart';
import 'package:test2/controller/business_controller.dart';

class BusinessPage extends GetView<BusinessController> {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Business News')),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: controller.businessList.length,
            itemBuilder: (context, index) {
              Business business = controller.businessList[index];
              return ListTile(
                // leading: Image.network(business.articles[index].urlToImage),
                // title: Text(business.articles[index].title),
                // subtitle: Text(business.articles[index].description),
                // Add more widgets to display additional data as needed
                title: Text(business.status),
              );
            },
          );
        },
      ),
    );
  }
}
