class TicketModel {
  final String id;
  final String title;
  final String description;
  final String admin;
  final String moreData;
  final String roomName;
  final String status;

  TicketModel({required this.id, required this.title, required this.description, required this.admin, required this.moreData, required this.roomName,required this.status});
  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
    id: json['id'],
    admin: json['admin'],
    description: json['description'],
    moreData: json['more_data'],
    title: json['title'],
    roomName: json['room_name'],
    status: json['status'],
  );
}
