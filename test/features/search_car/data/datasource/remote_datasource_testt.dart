// import 'dart:convert';
// import 'package:battmobility_assignment/features/search_car/data/datasource/remote_datasource.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/testing.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:battmobility_assignment/features/search_car/domain/entities/search_vehicle_entity.dart';
//
// @GenerateMocks([http.Client])
// void main() {
//   late SearchingRemoteDatasource datasource;
//   late MockClient mockHttpClient;
//
//   setUp(() {
//     mockHttpClient = MockClient((http.Request request){
//       return http.Response;
//     });
//     datasource = SearchingRemoteDatasource();
//   });
//
//   test('searchVehicle returns SearchResponse when the call completes successfully', () async {
//     final vehicleModel = SearchVehicleEntity(
//       start: DateTime.parse("2024-09-18T17:50:00"),
//       end: DateTime.parse("2024-09-18T19:50:00"),
//       minimumRange: 50,
//     );
//
//     final responsePayload = {
//       "vehicles": [
//         {"id": 1, "name": "Vehicle 1"},
//         {"id": 2, "name": "Vehicle 2"}
//       ]
//     };
//
//     when(mockHttpClient.get(any)).thenAnswer(
//           (_) async => http.Response(jsonEncode(responsePayload), 200),
//     );
//
//     final result = await datasource.searchVehicle(vehicleModel);
//
//     expect(result, isNotNull);
//     expect(result?.vehicles?.length, 2);
//     expect(result?.vehicles?.first.name, "Vehicle 1");
//   });
//
//   test('searchVehicle returns null when the call fails', () async {
//     final vehicleModel = SearchVehicleEntity(
//       start: DateTime.parse("2024-09-18T17:50:00"),
//       end: DateTime.parse("2024-09-18T19:50:00"),
//       minimumRange: 50,
//     );
//
//     when(mockHttpClient.get(any)).thenAnswer(
//           (_) async => http.Response('Not Found', 404),
//     );
//
//     final result = await datasource.searchVehicle(vehicleModel);
//
//     expect(result, isNull);
//   });
// }