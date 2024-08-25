

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
    print(vehicleModel.start.toIso8601String());
    String url = "https://api.battmobility.com/web-api/booking/v1/vehicles/public/searches?start=${DateFormat("yyyy-MM-ddTHH:mm:ss").format(vehicleModel.start)}%2B01:00%5BEurope/Brussels%5D&end=${DateFormat("yyyy-MM-ddTHH:mm:ss").format(vehicleModel.end!)}%2B01:00%5BEurope/Brussels%5D&minimumRange=${vehicleModel.minimumRange}";
    return await http.get(Uri.parse(url) //Uri.parse("https://api.battmobility.com/web-api/booking/v1/vehicles/public/searches?start=${dateTimeToStringFormat(vehicleModel.start)}&end=${dateTimeToStringFormat(vehicleModel.end!)}&minimumRange=${vehicleModel.minimumRange}")
    ).then((response){
      print(response.statusCode);
      print(response.body.toString());
      if(response.statusCode == 200){
        print(response.body);
        final result = SearchResponse.fromJson(jsonDecode(response.body));
        print(result.vehicles?.length);
        return result;
      } else {
        print(response.body);
        return null;
      }
    });
  }

}