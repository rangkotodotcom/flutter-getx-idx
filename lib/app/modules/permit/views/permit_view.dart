import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/permit/views/permit_create_view.dart';
import 'package:myapp/app/modules/permit/views/permit_list.dart';

import '../controllers/permit_controller.dart';

class PermitView extends GetView<PermitController> {
  const PermitView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Izin'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => Get.to(() => const PermitCreateView()),
            child: const Padding(
              padding: EdgeInsets.only(
                right: 10,
              ),
              child: Icon(
                Icons.add_box_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Data yang dimunculkan hanya data pada semester aktif",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // Trigger the refresh logic, usually involves refetching data
                await controller.refreshData();
              },
              child: FutureBuilder<List<Permit>>(
                future: controller.fetchPermitData(), // Your future method to fetch data
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available.'));
                  } else {
                    final permits = snapshot.data!;
                    return ListView.builder(
                      itemCount: permits.length,
                      itemBuilder: (context, index) {
                        final permit = permits[index];
                        return PermitListComponent(
                          id: permit.id,
                          status: permit.status,
                          statusStr: permit.statusStr,
                          permitDateStr: permit.permitDateStr,
                          permitCategoryName: permit.permitCategoryName,
                          description: permit.description,
                          fileName: permit.fileName,
                          fileBase: permit.fileBase,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
