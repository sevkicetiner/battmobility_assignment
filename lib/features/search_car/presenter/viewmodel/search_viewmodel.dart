import 'package:battmobility_assignment/features/search_car/data/datasource/remote_datasource.dart';
import 'package:battmobility_assignment/features/search_car/data/model/search_entity.dart';
import 'package:battmobility_assignment/features/search_car/data/repository/search_repository_imp.dart';
import 'package:battmobility_assignment/features/search_car/domain/entities/search_vehicle_entity.dart';
import 'package:battmobility_assignment/features/search_car/domain/repository/search_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


final searchingVM = ChangeNotifierProvider<SearchingViewModel>((ref){
  return SearchingViewModel(repository: SearchRepositoryImpl(SearchingRemoteDatasource()));
});

class SearchingViewModel extends ChangeNotifier {

  SearchingRepository repository;
  SearchResponse? response;
  double currentLocationLat=0.0;
  double currentLocationLong=0.0;
  DateTime? startDate;
  DateTime? endDate;

  int _distanceKm = 1;
  int get distanceKm => _distanceKm;
  set distanceKm(int value){
    _distanceKm = value;
    notifyListeners();
  }

  SearchingViewModel({required this.repository}) {
    searchVehicle(SearchVehicleEntity(start: DateTime(1978)));
    determinePosition();
  }

  Future searchVehicle(SearchVehicleEntity searchVehicleEntity) async {
    print("searchVehicle");
     try {
      response = await repository.searchVehicle(searchVehicleEntity);
      print('response geldi ${response?.vehicles?.length}');
      notifyListeners();
    } catch(e){
       if (kDebugMode) {
         print(e);
       }
     }
  }

  bool _customTileExpanded = false;
  set customTitleExpanded(bool value){
    _customTileExpanded = value;
    notifyListeners();
  }
  get customTileExpanded => _customTileExpanded;

  bool _isMap = false;

  bool get isMap => _isMap;

  set isMap(bool value) {
    _isMap = value;
    notifyListeners();
  }

  int _bottomNavCurrentIndex = 0;

  int get bottomNavCurrentIndex => _bottomNavCurrentIndex;

  set bottomNavCurrentIndex(int value) {
    _bottomNavCurrentIndex = value;
    notifyListeners();
  }

  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Geolocator.getCurrentPosition().then((value){
      currentLocationLat=value.latitude;
      currentLocationLong=value.longitude;
      notifyListeners();
    });
  }
}