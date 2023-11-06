class ParkLot {
  final String lotName;
  final String totalStalls;
  final String lotURL;


  const ParkLot({
    required this.lotName,
    required this.totalStalls,
    required this.lotURL,
  });
  
 factory ParkLot.fromJson(Map<String, dynamic> json) {
    return ParkLot(
      lotName: json['lotName'],
      totalStalls: json['totalStalls'],
      lotURL: json['lotURL'],
    );
  }

}