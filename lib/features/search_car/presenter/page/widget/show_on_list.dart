import 'package:battmobility_assignment/features/common/constants.dart';
import 'package:battmobility_assignment/features/search_car/data/model/search_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../viewmodel/search_viewmodel.dart';

class ShowOnList extends ConsumerWidget {

  SearchResponse? response;

  ShowOnList({
    super.key,
    required this.response
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(searchingVM);
    return ListView(
      children: response != null
          ? (response!.vehicles!.map((item) =>
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Card(
              elevation: 2,
              child: Container(
                height: 250,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex:1,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: Image.network(
                                "${BASE_URL}${item.imageUrl}", fit: BoxFit.fitHeight,
                                loadingBuilder: (context, child, loadingProgress) => (loadingProgress == null) ? child : Container(child: SizedBox(child: CircularProgressIndicator(), width: 20,height: 20,), width: 50,height: 50,),
                                errorBuilder: (context, error, stackTrace) => Image.asset("assets/img/img-car-placeholder.jpg", width: 50,height: 50,)).image,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: item.rentalType == "HOURLY" ?
                          Text("€${item.hourPrice}/h", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 18),) :
                          Text("€${item.dayPrice}/d", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 18),)  ,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5)
                          ),
                          
                        ),
                      ),),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Text(item.name!, style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600),),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.directions_walk, color: Colors.blue,),
                                  ),
                                  Flexible(child: Text("${(Geolocator.distanceBetween(viewmodel.currentLocationLat, viewmodel.currentLocationLong, item.homePosition?.latitude ?? 0.0, item.homePosition?.longitude ?? 0.0)/1000).toStringAsFixed(2)} km, to you", style: TextStyle(color: Colors.black54, fontSize: 18),))
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.location_on, color: Colors.blue,),
                                  ),
                                  Flexible(child: Text("${item.address} km, to you", style: TextStyle(color: Colors.black54, fontSize: 18),))
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.date_range, color: Colors.blue,),
                                  ),
                                  Flexible(child: Text("${item.electricRange} km", style: TextStyle(color: Colors.black54, fontSize: 18),))
                                ],
                              ),
                          ],),
                        ))
                  ],
                )
              ),
            )
          )
          // ExpansionTile(
          //   title: Text(item.name ?? ""),
          //   // leading: FadeInImage(placeholder: AssetImage('assets/img/img-car-placeholder.jpg'), image: NetworkImage("${BASE_URL}${item.imageUrl ?? ""}"), width: 50,height: 50, ),
          //   leading: Image.network("${BASE_URL}${item.imageUrl}", width: 50,height: 50, loadingBuilder: (context, child, loadingProgress) =>
          //   (loadingProgress == null) ? child : Container(child: SizedBox(child: CircularProgressIndicator(), width: 20,height: 20,), width: 50,height: 50,),
          //       errorBuilder: (context, error, stackTrace) => Image.asset("assets/img/img-car-placeholder.jpg", width: 50,height: 50,)),
          //   trailing: const Icon(Icons.arrow_drop_down),
          //   children: <Widget>[
          //     Text(item.description ?? ""),
          //   ],
          // ),
      ).toList())
          : [],
    );
  }
}