class MeetingModel {
  final int id;
  final String meetingName;
  final String date;
  final String startTime;
  final String endTime;
  final String meetingdescription;
  final String adminName;

  MeetingModel({required this.id, required this.meetingName, required this.date, required this.startTime, required this.endTime, required this.meetingdescription, required this.adminName});
  
  factory MeetingModel.fromJson(Map<String, dynamic> json) {
    return MeetingModel(
      id: json['id']??"",
      meetingName: json['name']??"",
      date: json['date']??"",
      startTime: json['start_time']??"",
      endTime: json['end_time']??"",
      meetingdescription: json['description']??"",
      adminName: json['admin']??"",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': meetingName,
      'date': date,
      'start_time': startTime,
      'end_time': endTime,
      'description': meetingdescription,
      'admin': adminName,
    };
  }
}