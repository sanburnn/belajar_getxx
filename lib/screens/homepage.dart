import 'package:belajar_getxx/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Belajar GetX',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                  color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 280,
              child: Obx(() {
                if (homeController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.productList.length,
                      itemBuilder: (context, index) {
                        var result =
                            homeController.productList[index].results![index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 20,
                                offset: Offset(0, 3),
                              )
                            ]),
                            height: 260,
                            width: 180,
                            child: Column(
                              children: [
                                Container(
                                    height: 200,
                                    width: 180,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/profile.png'),
                                      fit: BoxFit.cover,
                                    )),
                                Text(
                                  result.id.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  result.title!,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'December',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              }),
            ),
          )
        ],
      ),
    ));
  }
}
