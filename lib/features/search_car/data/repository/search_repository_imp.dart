import 'package:battmobility_assignment/features/search_car/data/datasource/remote_datasource.dart';
import 'package:battmobility_assignment/features/search_car/data/model/search_entity.dart';
import 'package:battmobility_assignment/features/search_car/domain/entities/search_vehicle_entity.dart';
import 'package:battmobility_assignment/features/search_car/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchingRepository {

  SearchingRemoteDatasource searchRemoteDatasource;

  SearchRepositoryImpl(this.searchRemoteDatasource);

  @override
  Future<SearchResponse?> searchVehicle(SearchVehicleEntity entity) async {
    final result = await searchRemoteDatasource.searchVehicle(entity);
    print("Future<SearchResponse?> searchVehicle( ${result?.vehicles?.length}");
    return result;
  }

}