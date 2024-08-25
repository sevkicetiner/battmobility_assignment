

import 'dart:convert';

import 'package:battmobility_assignment/features/common/utils.dart';
import 'package:battmobility_assignment/features/search_car/data/model/search_entity.dart';
import 'package:battmobility_assignment/features/search_car/domain/entities/search_vehicle_entity.dart';
import 'package:http/http.dart' as  http;
import 'package:intl/intl.dart';


abstract class SearchingRemoteDatasourceInterface{
  Future<SearchResponse?> searchVehicle(SearchVehicleEntity vehicleModel);
}

class SearchingRemoteDatasource implements SearchingRemoteDatasourceInterface {
  @override
  Future<SearchResponse?> searchVehicle(SearchVehicleEntity vehicleModel) async {
    String url = "https://api.battmobility.com/web-api/booking/v1/vehicles/public/searches?start=${DateFormat("yyyy-MM-ddTHH:mm:ss").format(vehicleModel.start)}%2B01:00%5BEurope/Brussels%5D&end=${DateFormat("yyyy-MM-ddTHH:mm:ss").format(vehicleModel.end!)}%2B01:00%5BEurope/Brussels%5D&minimumRange=${vehicleModel.minimumRange}";
    return await http.get(Uri.parse(url)).then((response){
      if(response.statusCode == 200){
        return SearchResponse.fromJson(jsonDecode(response.body));
      } else {
        print(response.body);
        return null;
      }
    });
  }

}