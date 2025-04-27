class TechnicianRequestModel {
  final String id;
  final String title;
  final String description;
  final String admin;
  final String type;
  final String roomName;
  final String moreData;
  final String status;
  TechnicianRequestModel({
    required this.id,
    required this.title,
    required this.description,
    required this.admin,
    required this.type,
    required this.roomName,
    required this.moreData,
    required this.status,
  });
  factory TechnicianRequestModel.fromJson(Map<String, dynamic> json) =>
      TechnicianRequestModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        admin: json['name'],
        type: json['type'],
        roomName: json['room_name'],
        moreData: json['more_data'],
        status: json['status'],
      );
}
