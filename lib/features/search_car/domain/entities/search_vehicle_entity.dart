
class SearchVehicleEntity {

 DateTime start;
 DateTime? end;
 int minimumRange;

  SearchVehicleEntity({
   required this.start,
   this.end,
   this.minimumRange = 0
  }){
    end ??= start.add(const Duration(days: 1));
  }
}