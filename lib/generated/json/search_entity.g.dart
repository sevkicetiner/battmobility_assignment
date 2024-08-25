import 'package:battmobility_assignment/generated/json/base/json_convert_content.dart';
import 'package:battmobility_assignment/features/search_car/data/model/search_entity.dart';

SearchResponse $SearchEntityFromJson(Map<String, dynamic> json) {
  final SearchResponse searchEntity = SearchResponse();
  final List<SearchVehicles>? vehicles = (json['vehicles'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<SearchVehicles>(e) as SearchVehicles)
      .toList();
  if (vehicles != null) {
    searchEntity.vehicles = vehicles;
  }
  return searchEntity;
}

Map<String, dynamic> $SearchEntityToJson(SearchResponse entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['vehicles'] = entity.vehicles?.map((v) => v.toJson()).toList();
  return data;
}

extension SearchEntityExtension on SearchResponse {
  SearchResponse copyWith({
    List<SearchVehicles>? vehicles,
  }) {
    return SearchResponse()
      ..vehicles = vehicles ?? this.vehicles;
  }
}

SearchVehicles $SearchVehiclesFromJson(Map<String, dynamic> json) {
  final SearchVehicles searchVehicles = SearchVehicles();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    searchVehicles.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    searchVehicles.name = name;
  }
  final String? licensePlate = jsonConvert.convert<String>(
      json['licensePlate']);
  if (licensePlate != null) {
    searchVehicles.licensePlate = licensePlate;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    searchVehicles.description = description;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    searchVehicles.address = address;
  }
  final SearchVehiclesHomePosition? homePosition = jsonConvert.convert<
      SearchVehiclesHomePosition>(json['homePosition']);
  if (homePosition != null) {
    searchVehicles.homePosition = homePosition;
  }
  final String? owner = jsonConvert.convert<String>(json['owner']);
  if (owner != null) {
    searchVehicles.owner = owner;
  }
  final SearchVehiclesOwnerReference? ownerReference = jsonConvert.convert<
      SearchVehiclesOwnerReference>(json['ownerReference']);
  if (ownerReference != null) {
    searchVehicles.ownerReference = ownerReference;
  }
  final String? timeZone = jsonConvert.convert<String>(json['timeZone']);
  if (timeZone != null) {
    searchVehicles.timeZone = timeZone;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    searchVehicles.imageUrl = imageUrl;
  }
  final int? seats = jsonConvert.convert<int>(json['seats']);
  if (seats != null) {
    searchVehicles.seats = seats;
  }
  final double? dayPrice = jsonConvert.convert<double>(json['dayPrice']);
  if (dayPrice != null) {
    searchVehicles.dayPrice = dayPrice;
  }
  final double? hourPrice = jsonConvert.convert<double>(json['hourPrice']);
  if (hourPrice != null) {
    searchVehicles.hourPrice = hourPrice;
  }
  final double? kilometerPrice = jsonConvert.convert<double>(
      json['kilometerPrice']);
  if (kilometerPrice != null) {
    searchVehicles.kilometerPrice = kilometerPrice;
  }
  final SearchVehiclesFinishedBookingPrice? finishedBookingPrice = jsonConvert
      .convert<SearchVehiclesFinishedBookingPrice>(
      json['finishedBookingPrice']);
  if (finishedBookingPrice != null) {
    searchVehicles.finishedBookingPrice = finishedBookingPrice;
  }
  final String? rentalType = jsonConvert.convert<String>(json['rentalType']);
  if (rentalType != null) {
    searchVehicles.rentalType = rentalType;
  }
  final SearchVehiclesPermissions? permissions = jsonConvert.convert<
      SearchVehiclesPermissions>(json['permissions']);
  if (permissions != null) {
    searchVehicles.permissions = permissions;
  }
  final dynamic details = json['details'];
  if (details != null) {
    searchVehicles.details = details;
  }
  final dynamic equipmentIds = json['equipmentIds'];
  if (equipmentIds != null) {
    searchVehicles.equipmentIds = equipmentIds;
  }
  final dynamic intentIds = json['intentIds'];
  if (intentIds != null) {
    searchVehicles.intentIds = intentIds;
  }
  final bool? automaticBookingApproval = jsonConvert.convert<bool>(
      json['automaticBookingApproval']);
  if (automaticBookingApproval != null) {
    searchVehicles.automaticBookingApproval = automaticBookingApproval;
  }
  final bool? alwaysAvailable = jsonConvert.convert<bool>(
      json['alwaysAvailable']);
  if (alwaysAvailable != null) {
    searchVehicles.alwaysAvailable = alwaysAvailable;
  }
  final int? electricRange = jsonConvert.convert<int>(json['electricRange']);
  if (electricRange != null) {
    searchVehicles.electricRange = electricRange;
  }
  final bool? instantBookingPossible = jsonConvert.convert<bool>(
      json['instantBookingPossible']);
  if (instantBookingPossible != null) {
    searchVehicles.instantBookingPossible = instantBookingPossible;
  }
  final String? operationalStatus = jsonConvert.convert<String>(
      json['operationalStatus']);
  if (operationalStatus != null) {
    searchVehicles.operationalStatus = operationalStatus;
  }
  final String? expectedInFleetDate = jsonConvert.convert<String>(
      json['expectedInFleetDate']);
  if (expectedInFleetDate != null) {
    searchVehicles.expectedInFleetDate = expectedInFleetDate;
  }
  final String? actualInFleetDate = jsonConvert.convert<String>(
      json['actualInFleetDate']);
  if (actualInFleetDate != null) {
    searchVehicles.actualInFleetDate = actualInFleetDate;
  }
  final String? expectedOutOfFleetDate = jsonConvert.convert<String>(
      json['expectedOutOfFleetDate']);
  if (expectedOutOfFleetDate != null) {
    searchVehicles.expectedOutOfFleetDate = expectedOutOfFleetDate;
  }
  final dynamic actualOutOfFleetDate = json['actualOutOfFleetDate'];
  if (actualOutOfFleetDate != null) {
    searchVehicles.actualOutOfFleetDate = actualOutOfFleetDate;
  }
  final SearchVehiclesOrganization? organization = jsonConvert.convert<
      SearchVehiclesOrganization>(json['organization']);
  if (organization != null) {
    searchVehicles.organization = organization;
  }
  final dynamic approvedBookingUsers = json['approvedBookingUsers'];
  if (approvedBookingUsers != null) {
    searchVehicles.approvedBookingUsers = approvedBookingUsers;
  }
  final String? vehicleTypeId = jsonConvert.convert<String>(
      json['vehicleTypeId']);
  if (vehicleTypeId != null) {
    searchVehicles.vehicleTypeId = vehicleTypeId;
  }
  return searchVehicles;
}

Map<String, dynamic> $SearchVehiclesToJson(SearchVehicles entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['licensePlate'] = entity.licensePlate;
  data['description'] = entity.description;
  data['address'] = entity.address;
  data['homePosition'] = entity.homePosition?.toJson();
  data['owner'] = entity.owner;
  data['ownerReference'] = entity.ownerReference?.toJson();
  data['timeZone'] = entity.timeZone;
  data['imageUrl'] = entity.imageUrl;
  data['seats'] = entity.seats;
  data['dayPrice'] = entity.dayPrice;
  data['hourPrice'] = entity.hourPrice;
  data['kilometerPrice'] = entity.kilometerPrice;
  data['finishedBookingPrice'] = entity.finishedBookingPrice?.toJson();
  data['rentalType'] = entity.rentalType;
  data['permissions'] = entity.permissions?.toJson();
  data['details'] = entity.details;
  data['equipmentIds'] = entity.equipmentIds;
  data['intentIds'] = entity.intentIds;
  data['automaticBookingApproval'] = entity.automaticBookingApproval;
  data['alwaysAvailable'] = entity.alwaysAvailable;
  data['electricRange'] = entity.electricRange;
  data['instantBookingPossible'] = entity.instantBookingPossible;
  data['operationalStatus'] = entity.operationalStatus;
  data['expectedInFleetDate'] = entity.expectedInFleetDate;
  data['actualInFleetDate'] = entity.actualInFleetDate;
  data['expectedOutOfFleetDate'] = entity.expectedOutOfFleetDate;
  data['actualOutOfFleetDate'] = entity.actualOutOfFleetDate;
  data['organization'] = entity.organization?.toJson();
  data['approvedBookingUsers'] = entity.approvedBookingUsers;
  data['vehicleTypeId'] = entity.vehicleTypeId;
  return data;
}

extension SearchVehiclesExtension on SearchVehicles {
  SearchVehicles copyWith({
    String? id,
    String? name,
    String? licensePlate,
    String? description,
    String? address,
    SearchVehiclesHomePosition? homePosition,
    String? owner,
    SearchVehiclesOwnerReference? ownerReference,
    String? timeZone,
    String? imageUrl,
    int? seats,
    double? dayPrice,
    double? hourPrice,
    double? kilometerPrice,
    SearchVehiclesFinishedBookingPrice? finishedBookingPrice,
    String? rentalType,
    SearchVehiclesPermissions? permissions,
    dynamic details,
    dynamic equipmentIds,
    dynamic intentIds,
    bool? automaticBookingApproval,
    bool? alwaysAvailable,
    int? electricRange,
    bool? instantBookingPossible,
    String? operationalStatus,
    String? expectedInFleetDate,
    String? actualInFleetDate,
    String? expectedOutOfFleetDate,
    dynamic actualOutOfFleetDate,
    SearchVehiclesOrganization? organization,
    dynamic approvedBookingUsers,
    String? vehicleTypeId,
  }) {
    return SearchVehicles()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..licensePlate = licensePlate ?? this.licensePlate
      ..description = description ?? this.description
      ..address = address ?? this.address
      ..homePosition = homePosition ?? this.homePosition
      ..owner = owner ?? this.owner
      ..ownerReference = ownerReference ?? this.ownerReference
      ..timeZone = timeZone ?? this.timeZone
      ..imageUrl = imageUrl ?? this.imageUrl
      ..seats = seats ?? this.seats
      ..dayPrice = dayPrice ?? this.dayPrice
      ..hourPrice = hourPrice ?? this.hourPrice
      ..kilometerPrice = kilometerPrice ?? this.kilometerPrice
      ..finishedBookingPrice = finishedBookingPrice ?? this.finishedBookingPrice
      ..rentalType = rentalType ?? this.rentalType
      ..permissions = permissions ?? this.permissions
      ..details = details ?? this.details
      ..equipmentIds = equipmentIds ?? this.equipmentIds
      ..intentIds = intentIds ?? this.intentIds
      ..automaticBookingApproval = automaticBookingApproval ??
          this.automaticBookingApproval
      ..alwaysAvailable = alwaysAvailable ?? this.alwaysAvailable
      ..electricRange = electricRange ?? this.electricRange
      ..instantBookingPossible = instantBookingPossible ??
          this.instantBookingPossible
      ..operationalStatus = operationalStatus ?? this.operationalStatus
      ..expectedInFleetDate = expectedInFleetDate ?? this.expectedInFleetDate
      ..actualInFleetDate = actualInFleetDate ?? this.actualInFleetDate
      ..expectedOutOfFleetDate = expectedOutOfFleetDate ??
          this.expectedOutOfFleetDate
      ..actualOutOfFleetDate = actualOutOfFleetDate ?? this.actualOutOfFleetDate
      ..organization = organization ?? this.organization
      ..approvedBookingUsers = approvedBookingUsers ?? this.approvedBookingUsers
      ..vehicleTypeId = vehicleTypeId ?? this.vehicleTypeId;
  }
}

SearchVehiclesHomePosition $SearchVehiclesHomePositionFromJson(
    Map<String, dynamic> json) {
  final SearchVehiclesHomePosition searchVehiclesHomePosition = SearchVehiclesHomePosition();
  final double? longitude = jsonConvert.convert<double>(json['longitude']);
  if (longitude != null) {
    searchVehiclesHomePosition.longitude = longitude;
  }
  final double? latitude = jsonConvert.convert<double>(json['latitude']);
  if (latitude != null) {
    searchVehiclesHomePosition.latitude = latitude;
  }
  return searchVehiclesHomePosition;
}

Map<String, dynamic> $SearchVehiclesHomePositionToJson(
    SearchVehiclesHomePosition entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['longitude'] = entity.longitude;
  data['latitude'] = entity.latitude;
  return data;
}

extension SearchVehiclesHomePositionExtension on SearchVehiclesHomePosition {
  SearchVehiclesHomePosition copyWith({
    double? longitude,
    double? latitude,
  }) {
    return SearchVehiclesHomePosition()
      ..longitude = longitude ?? this.longitude
      ..latitude = latitude ?? this.latitude;
  }
}

SearchVehiclesOwnerReference $SearchVehiclesOwnerReferenceFromJson(
    Map<String, dynamic> json) {
  final SearchVehiclesOwnerReference searchVehiclesOwnerReference = SearchVehiclesOwnerReference();
  final String? remoteId = jsonConvert.convert<String>(json['remoteId']);
  if (remoteId != null) {
    searchVehiclesOwnerReference.remoteId = remoteId;
  }
  final dynamic userName = json['userName'];
  if (userName != null) {
    searchVehiclesOwnerReference.userName = userName;
  }
  final dynamic imageUrl = json['imageUrl'];
  if (imageUrl != null) {
    searchVehiclesOwnerReference.imageUrl = imageUrl;
  }
  final String? displayName = jsonConvert.convert<String>(json['displayName']);
  if (displayName != null) {
    searchVehiclesOwnerReference.displayName = displayName;
  }
  return searchVehiclesOwnerReference;
}

Map<String, dynamic> $SearchVehiclesOwnerReferenceToJson(
    SearchVehiclesOwnerReference entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['remoteId'] = entity.remoteId;
  data['userName'] = entity.userName;
  data['imageUrl'] = entity.imageUrl;
  data['displayName'] = entity.displayName;
  return data;
}

extension SearchVehiclesOwnerReferenceExtension on SearchVehiclesOwnerReference {
  SearchVehiclesOwnerReference copyWith({
    String? remoteId,
    dynamic userName,
    dynamic imageUrl,
    String? displayName,
  }) {
    return SearchVehiclesOwnerReference()
      ..remoteId = remoteId ?? this.remoteId
      ..userName = userName ?? this.userName
      ..imageUrl = imageUrl ?? this.imageUrl
      ..displayName = displayName ?? this.displayName;
  }
}

SearchVehiclesFinishedBookingPrice $SearchVehiclesFinishedBookingPriceFromJson(
    Map<String, dynamic> json) {
  final SearchVehiclesFinishedBookingPrice searchVehiclesFinishedBookingPrice = SearchVehiclesFinishedBookingPrice();
  final String? startDate = jsonConvert.convert<String>(json['startDate']);
  if (startDate != null) {
    searchVehiclesFinishedBookingPrice.startDate = startDate;
  }
  final String? endDate = jsonConvert.convert<String>(json['endDate']);
  if (endDate != null) {
    searchVehiclesFinishedBookingPrice.endDate = endDate;
  }
  final double? kmPrice = jsonConvert.convert<double>(json['kmPrice']);
  if (kmPrice != null) {
    searchVehiclesFinishedBookingPrice.kmPrice = kmPrice;
  }
  final int? km = jsonConvert.convert<int>(json['km']);
  if (km != null) {
    searchVehiclesFinishedBookingPrice.km = km;
  }
  final int? amount = jsonConvert.convert<int>(json['amount']);
  if (amount != null) {
    searchVehiclesFinishedBookingPrice.amount = amount;
  }
  final String? unit = jsonConvert.convert<String>(json['unit']);
  if (unit != null) {
    searchVehiclesFinishedBookingPrice.unit = unit;
  }
  final double? unitPrice = jsonConvert.convert<double>(json['unitPrice']);
  if (unitPrice != null) {
    searchVehiclesFinishedBookingPrice.unitPrice = unitPrice;
  }
  final double? timeTotal = jsonConvert.convert<double>(json['timeTotal']);
  if (timeTotal != null) {
    searchVehiclesFinishedBookingPrice.timeTotal = timeTotal;
  }
  final dynamic hourlyTotalNotCharged = json['hourlyTotalNotCharged'];
  if (hourlyTotalNotCharged != null) {
    searchVehiclesFinishedBookingPrice.hourlyTotalNotCharged =
        hourlyTotalNotCharged;
  }
  final bool? changeFromHourlyToDaily = jsonConvert.convert<bool>(
      json['changeFromHourlyToDaily']);
  if (changeFromHourlyToDaily != null) {
    searchVehiclesFinishedBookingPrice.changeFromHourlyToDaily =
        changeFromHourlyToDaily;
  }
  final double? kmTotal = jsonConvert.convert<double>(json['kmTotal']);
  if (kmTotal != null) {
    searchVehiclesFinishedBookingPrice.kmTotal = kmTotal;
  }
  final double? total = jsonConvert.convert<double>(json['total']);
  if (total != null) {
    searchVehiclesFinishedBookingPrice.total = total;
  }
  final double? kmPriceExclVat = jsonConvert.convert<double>(
      json['kmPriceExclVat']);
  if (kmPriceExclVat != null) {
    searchVehiclesFinishedBookingPrice.kmPriceExclVat = kmPriceExclVat;
  }
  final double? unitPriceExclVat = jsonConvert.convert<double>(
      json['unitPriceExclVat']);
  if (unitPriceExclVat != null) {
    searchVehiclesFinishedBookingPrice.unitPriceExclVat = unitPriceExclVat;
  }
  final dynamic hourlyTotalNotChargedExclVat = json['hourlyTotalNotChargedExclVat'];
  if (hourlyTotalNotChargedExclVat != null) {
    searchVehiclesFinishedBookingPrice.hourlyTotalNotChargedExclVat =
        hourlyTotalNotChargedExclVat;
  }
  final double? timeTotalExclVat = jsonConvert.convert<double>(
      json['timeTotalExclVat']);
  if (timeTotalExclVat != null) {
    searchVehiclesFinishedBookingPrice.timeTotalExclVat = timeTotalExclVat;
  }
  final double? kmTotalExclVat = jsonConvert.convert<double>(
      json['kmTotalExclVat']);
  if (kmTotalExclVat != null) {
    searchVehiclesFinishedBookingPrice.kmTotalExclVat = kmTotalExclVat;
  }
  final double? totalExclVat = jsonConvert.convert<double>(
      json['totalExclVat']);
  if (totalExclVat != null) {
    searchVehiclesFinishedBookingPrice.totalExclVat = totalExclVat;
  }
  final double? totalVat = jsonConvert.convert<double>(json['totalVat']);
  if (totalVat != null) {
    searchVehiclesFinishedBookingPrice.totalVat = totalVat;
  }
  final double? vatRate = jsonConvert.convert<double>(json['vatRate']);
  if (vatRate != null) {
    searchVehiclesFinishedBookingPrice.vatRate = vatRate;
  }
  return searchVehiclesFinishedBookingPrice;
}

Map<String, dynamic> $SearchVehiclesFinishedBookingPriceToJson(
    SearchVehiclesFinishedBookingPrice entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['startDate'] = entity.startDate;
  data['endDate'] = entity.endDate;
  data['kmPrice'] = entity.kmPrice;
  data['km'] = entity.km;
  data['amount'] = entity.amount;
  data['unit'] = entity.unit;
  data['unitPrice'] = entity.unitPrice;
  data['timeTotal'] = entity.timeTotal;
  data['hourlyTotalNotCharged'] = entity.hourlyTotalNotCharged;
  data['changeFromHourlyToDaily'] = entity.changeFromHourlyToDaily;
  data['kmTotal'] = entity.kmTotal;
  data['total'] = entity.total;
  data['kmPriceExclVat'] = entity.kmPriceExclVat;
  data['unitPriceExclVat'] = entity.unitPriceExclVat;
  data['hourlyTotalNotChargedExclVat'] = entity.hourlyTotalNotChargedExclVat;
  data['timeTotalExclVat'] = entity.timeTotalExclVat;
  data['kmTotalExclVat'] = entity.kmTotalExclVat;
  data['totalExclVat'] = entity.totalExclVat;
  data['totalVat'] = entity.totalVat;
  data['vatRate'] = entity.vatRate;
  return data;
}

extension SearchVehiclesFinishedBookingPriceExtension on SearchVehiclesFinishedBookingPrice {
  SearchVehiclesFinishedBookingPrice copyWith({
    String? startDate,
    String? endDate,
    double? kmPrice,
    int? km,
    int? amount,
    String? unit,
    double? unitPrice,
    double? timeTotal,
    dynamic hourlyTotalNotCharged,
    bool? changeFromHourlyToDaily,
    double? kmTotal,
    double? total,
    double? kmPriceExclVat,
    double? unitPriceExclVat,
    dynamic hourlyTotalNotChargedExclVat,
    double? timeTotalExclVat,
    double? kmTotalExclVat,
    double? totalExclVat,
    double? totalVat,
    double? vatRate,
  }) {
    return SearchVehiclesFinishedBookingPrice()
      ..startDate = startDate ?? this.startDate
      ..endDate = endDate ?? this.endDate
      ..kmPrice = kmPrice ?? this.kmPrice
      ..km = km ?? this.km
      ..amount = amount ?? this.amount
      ..unit = unit ?? this.unit
      ..unitPrice = unitPrice ?? this.unitPrice
      ..timeTotal = timeTotal ?? this.timeTotal
      ..hourlyTotalNotCharged = hourlyTotalNotCharged ??
          this.hourlyTotalNotCharged
      ..changeFromHourlyToDaily = changeFromHourlyToDaily ??
          this.changeFromHourlyToDaily
      ..kmTotal = kmTotal ?? this.kmTotal
      ..total = total ?? this.total
      ..kmPriceExclVat = kmPriceExclVat ?? this.kmPriceExclVat
      ..unitPriceExclVat = unitPriceExclVat ?? this.unitPriceExclVat
      ..hourlyTotalNotChargedExclVat = hourlyTotalNotChargedExclVat ??
          this.hourlyTotalNotChargedExclVat
      ..timeTotalExclVat = timeTotalExclVat ?? this.timeTotalExclVat
      ..kmTotalExclVat = kmTotalExclVat ?? this.kmTotalExclVat
      ..totalExclVat = totalExclVat ?? this.totalExclVat
      ..totalVat = totalVat ?? this.totalVat
      ..vatRate = vatRate ?? this.vatRate;
  }
}

SearchVehiclesPermissions $SearchVehiclesPermissionsFromJson(
    Map<String, dynamic> json) {
  final SearchVehiclesPermissions searchVehiclesPermissions = SearchVehiclesPermissions();
  final bool? petsAllowed = jsonConvert.convert<bool>(json['petsAllowed']);
  if (petsAllowed != null) {
    searchVehiclesPermissions.petsAllowed = petsAllowed;
  }
  final bool? kidsAllowed = jsonConvert.convert<bool>(json['kidsAllowed']);
  if (kidsAllowed != null) {
    searchVehiclesPermissions.kidsAllowed = kidsAllowed;
  }
  final bool? abroadAllowed = jsonConvert.convert<bool>(json['abroadAllowed']);
  if (abroadAllowed != null) {
    searchVehiclesPermissions.abroadAllowed = abroadAllowed;
  }
  return searchVehiclesPermissions;
}

Map<String, dynamic> $SearchVehiclesPermissionsToJson(
    SearchVehiclesPermissions entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['petsAllowed'] = entity.petsAllowed;
  data['kidsAllowed'] = entity.kidsAllowed;
  data['abroadAllowed'] = entity.abroadAllowed;
  return data;
}

extension SearchVehiclesPermissionsExtension on SearchVehiclesPermissions {
  SearchVehiclesPermissions copyWith({
    bool? petsAllowed,
    bool? kidsAllowed,
    bool? abroadAllowed,
  }) {
    return SearchVehiclesPermissions()
      ..petsAllowed = petsAllowed ?? this.petsAllowed
      ..kidsAllowed = kidsAllowed ?? this.kidsAllowed
      ..abroadAllowed = abroadAllowed ?? this.abroadAllowed;
  }
}

SearchVehiclesOrganization $SearchVehiclesOrganizationFromJson(
    Map<String, dynamic> json) {
  final SearchVehiclesOrganization searchVehiclesOrganization = SearchVehiclesOrganization();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    searchVehiclesOrganization.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    searchVehiclesOrganization.name = name;
  }
  return searchVehiclesOrganization;
}

Map<String, dynamic> $SearchVehiclesOrganizationToJson(
    SearchVehiclesOrganization entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  return data;
}

extension SearchVehiclesOrganizationExtension on SearchVehiclesOrganization {
  SearchVehiclesOrganization copyWith({
    String? id,
    String? name,
  }) {
    return SearchVehiclesOrganization()
      ..id = id ?? this.id
      ..name = name ?? this.name;
  }
}