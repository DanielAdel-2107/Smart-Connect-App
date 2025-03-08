class MedicalRequestModel {
  final String id;
  final String admin;
  final String latitude;
  final String longitude;
  final String description;
  final String title;
  final String moreData;
  final String state;
  MedicalRequestModel(
      {required this.admin,
      required this.latitude,
      required this.longitude,
      required this.description,
      required this.title,
      required this.moreData,
      required this.state,
      required this.id});
  factory MedicalRequestModel.fromJson(Map<String, dynamic> json) =>
      MedicalRequestModel(
        id: json['id'],
        admin: json['name'],
        latitude: json['latitude'],
        longitude: json['longtude'],
        description: json['description'],
        title: json['title'],
        moreData: json['more_data'],
        state: json['state'],
      );
}
