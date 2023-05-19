import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test2/controller/nav_controller.dart';
import 'package:test2/pages/business_page.dart';
import 'package:test2/pages/tesla_page.dart';

class HomePage extends GetView<NavController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: Obx(
        () => IndexedStack(
          index: controller.pageIndex.value,
          children: [
            BusinessPage(),
            TeslaPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.pageIndex.value,
          onTap: (index) => controller.changePageIndex(index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: 'business'),
            BottomNavigationBarItem(
                icon: Icon(Icons.car_crash), label: 'tesla'),
          ]),
    );
  }
}
