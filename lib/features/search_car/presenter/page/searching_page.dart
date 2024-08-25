import 'dart:typed_data';

import 'package:battmobility_assignment/features/common/constants.dart';
import 'package:battmobility_assignment/features/search_car/domain/entities/search_vehicle_entity.dart';
import 'package:battmobility_assignment/features/search_car/presenter/page/widget/show_on_list.dart';
import 'package:battmobility_assignment/features/search_car/presenter/page/widget/show_on_map.dart';
import 'package:battmobility_assignment/features/search_car/presenter/viewmodel/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchingPage extends ConsumerWidget {
  SearchingPage({super.key});

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    return showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 90)));
  }
  final TextEditingController _controllerStartDate = TextEditingController();
  final TextEditingController _controllerEndDate = TextEditingController();
  FocusNode focusNodeStart = FocusNode();
  FocusNode focusNodeEnd = FocusNode();
  DateTime? selectedStart;
  DateTime? selectedEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(searchingVM);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: viewModel.isMap ? 240 :50,
          title: viewModel.isMap
              ? Container(
                  height: 240,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          autofocus: true,
                          focusNode: focusNodeStart,
                          controller: _controllerStartDate,
                          decoration: const InputDecoration(
                            hintText: "Select a start date",
                            labelText: "Start date"
                          ),
                          onTap: ()async{
                            selectedStart = await _showDatePicker(context);
                            _controllerStartDate.text = "${selectedStart?.day}/${selectedStart?.month}/${selectedStart?.year}";
                            focusNodeStart.unfocus();
                          },
                        ), TextField(
                          autofocus: true,
                          focusNode: focusNodeEnd,
                          controller: _controllerEndDate,
                          decoration: const InputDecoration(
                              hintText: "Select an end date",
                              labelText: "End date"
                          ),
                          onTap: ()async{
                            selectedEnd = await _showDatePicker(context);
                            _controllerEndDate.text = "${selectedEnd?.day}/${selectedEnd?.month}/${selectedEnd?.year}";
                            focusNodeEnd.unfocus();
                          },
                        ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Distance Km :"),
                        DropdownButton<int>(
                            hint: Text("Pick"),
                            value: viewModel.distanceKm,
                            items: <int>[1, 3, 5, 10, 20, 50, 100, 200]
                                .map((int value) {
                              return new DropdownMenuItem<int>(
                                value: value,
                                child: new Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              viewModel.distanceKm = newVal!;
                            }),
                      ],
                    ),
                        Row(
                          children: [
                            Expanded(child: ElevatedButton(onPressed: ()async{
                              await viewModel.searchVehicle(SearchVehicleEntity(start: selectedStart!, end: selectedEnd, minimumRange: viewModel.distanceKm));
                            }, child: Text("Apply"))),
                            SizedBox(width: 20,),
                            Expanded(child: ElevatedButton(onPressed: ()=>viewModel.isMap=false,child: Text("Cancel"),)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Filters"),
                  IconButton(onPressed: ()=>viewModel.isMap=true, icon: const Icon(Icons.arrow_drop_down_sharp)),
                ],
              ),
      ),
      body: viewModel.bottomNavCurrentIndex == 0
          ? ShowOnList(
              response: viewModel.response,
            )
          : ShowOnMaps(
              response: viewModel.response,
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.bottomNavCurrentIndex,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "MAP")
        ],
        onTap: (index) {
          viewModel.bottomNavCurrentIndex = index;
        },
      ),
    );
  }
}


