import 'package:battmobility_assignment/features/search_car/data/model/search_entity.dart';
import 'package:battmobility_assignment/features/search_car/domain/entities/search_vehicle_entity.dart';

abstract class SearchingRepository {
  Future<SearchResponse?> searchVehicle(SearchVehicleEntity searchVehicleEntity);
}