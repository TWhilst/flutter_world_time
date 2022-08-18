import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/world_class_list/model/detail_model.dart';
import 'package:untitled2/world_class_list/view_model/view_model.dart';
import 'package:untitled2/world_class_list/views/home_page/home_page.dart';

class CountryList extends StatelessWidget {
  const CountryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorldTimeViewModel worldTimeViewModel = context.watch<WorldTimeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "World Time",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          itemCount: worldTimeViewModel.worldTimeDetails.length,
          itemBuilder: (context, index) {
            DetailModel details = worldTimeViewModel.worldTimeDetails[index];
            return GestureDetector(
              onTap: () {
                worldTimeViewModel.getWorldData(index);
                // worldTimeViewModel.setIsDayTime2();
               Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical:5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 65,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      foregroundImage: NetworkImage(details.flag!),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        details.country!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
