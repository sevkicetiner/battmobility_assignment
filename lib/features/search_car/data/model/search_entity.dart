import 'package:battmobility_assignment/generated/json/base/json_field.dart';
import 'package:battmobility_assignment/generated/json/search_entity.g.dart';
import 'dart:convert';
export 'package:battmobility_assignment/generated/json/search_entity.g.dart';

@JsonSerializable()
class SearchResponse {
	List<SearchVehicles>? vehicles;

	SearchResponse();

	factory SearchResponse.fromJson(Map<String, dynamic> json) => $SearchEntityFromJson(json);

	Map<String, dynamic> toJson() => $SearchEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SearchVehicles {
	String? id;
	String? name;
	String? licensePlate;
	String? description;
	String? address;
	SearchVehiclesHomePosition? homePosition;
	String? owner;
	SearchVehiclesOwnerReference? ownerReference;
	String? timeZone;
	String? imageUrl;
	int? seats;
	double? dayPrice;
	double? hourPrice;
	double? kilometerPrice;
	SearchVehiclesFinishedBookingPrice? finishedBookingPrice;
	String? rentalType;
	SearchVehiclesPermissions? permissions;
	dynamic details;
	dynamic equipmentIds;
	dynamic intentIds;
	bool? automaticBookingApproval;
	bool? alwaysAvailable;
	int? electricRange;
	bool? instantBookingPossible;
	String? operationalStatus;
	String? expectedInFleetDate;
	String? actualInFleetDate;
	String? expectedOutOfFleetDate;
	dynamic actualOutOfFleetDate;
	SearchVehiclesOrganization? organization;
	dynamic approvedBookingUsers;
	String? vehicleTypeId;

	SearchVehicles();

	factory SearchVehicles.fromJson(Map<String, dynamic> json) => $SearchVehiclesFromJson(json);

	Map<String, dynamic> toJson() => $SearchVehiclesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SearchVehiclesHomePosition {
	double? longitude;
	double? latitude;

	SearchVehiclesHomePosition();

	factory SearchVehiclesHomePosition.fromJson(Map<String, dynamic> json) => $SearchVehiclesHomePositionFromJson(json);

	Map<String, dynamic> toJson() => $SearchVehiclesHomePositionToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SearchVehiclesOwnerReference {
	String? remoteId;
	dynamic userName;
	dynamic imageUrl;
	String? displayName;

	SearchVehiclesOwnerReference();

	factory SearchVehiclesOwnerReference.fromJson(Map<String, dynamic> json) => $SearchVehiclesOwnerReferenceFromJson(json);

	Map<String, dynamic> toJson() => $SearchVehiclesOwnerReferenceToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SearchVehiclesFinishedBookingPrice {
	String? startDate;
	String? endDate;
	double? kmPrice;
	int? km;
	int? amount;
	String? unit;
	double? unitPrice;
	double? timeTotal;
	dynamic hourlyTotalNotCharged;
	bool? changeFromHourlyToDaily;
	double? kmTotal;
	double? total;
	double? kmPriceExclVat;
	double? unitPriceExclVat;
	dynamic hourlyTotalNotChargedExclVat;
	double? timeTotalExclVat;
	double? kmTotalExclVat;
	double? totalExclVat;
	double? totalVat;
	double? vatRate;

	SearchVehiclesFinishedBookingPrice();

	factory SearchVehiclesFinishedBookingPrice.fromJson(Map<String, dynamic> json) => $SearchVehiclesFinishedBookingPriceFromJson(json);

	Map<String, dynamic> toJson() => $SearchVehiclesFinishedBookingPriceToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SearchVehiclesPermissions {
	bool? petsAllowed;
	bool? kidsAllowed;
	bool? abroadAllowed;

	SearchVehiclesPermissions();

	factory SearchVehiclesPermissions.fromJson(Map<String, dynamic> json) => $SearchVehiclesPermissionsFromJson(json);

	Map<String, dynamic> toJson() => $SearchVehiclesPermissionsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SearchVehiclesOrganization {
	String? id;
	String? name;

	SearchVehiclesOrganization();

	factory SearchVehiclesOrganization.fromJson(Map<String, dynamic> json) => $SearchVehiclesOrganizationFromJson(json);

	Map<String, dynamic> toJson() => $SearchVehiclesOrganizationToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}