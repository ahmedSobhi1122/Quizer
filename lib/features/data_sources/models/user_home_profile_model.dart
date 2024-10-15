import 'package:dio/dio.dart';
import 'package:quizer/core/constants/enum.dart';

class HomeProfileModel {
  final String? userID;
  final String? firstName;
  final String? lastName;
  final Rank? rank;
  final int? points;
  final String? profileImage;
  final DailyTask? dailyTask;

  HomeProfileModel({
    this.userID,
    this.firstName,
    this.lastName,
    this.rank,
    this.points,
    this.profileImage,
    this.dailyTask
  });

  factory HomeProfileModel.fromJson(Map<String, dynamic> json) =>
      HomeProfileModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        rank: getRankFromInt(json['rank']),
        points: json['points'],
        profileImage: json['profileImage'],
        dailyTask: deserializeDailyTask(json['dailyTask'])
      );

  FormData toJson() => FormData.fromMap({'userID': userID});
}

Rank getRankFromInt(int rank) {
  switch (rank) {
    case 0:
      return Rank.NEWBIE;
    case 1:
      return Rank.APPRENTICE;
    case 2:
      return Rank.CHALLENGER;
    case 3:
      return Rank.EXPERT;
    case 4:
      return Rank.MASTER_MIND;
    default:
      throw Exception('Invalid rank value');
  }
}

DailyTask deserializeDailyTask(Map<String, dynamic> json)
{
  return DailyTask(
    taskID: json['taskID'],
    userID: json['userID'],
    taskName: json['taskName'],
    progress: json['progress'],
    goal: json['goal'],
    isCompleted: json['isCompleted'],
    points: json['points'],
    lastReset: DateTime.parse(json['lastReset']));
}

class DailyTask {
  final int? taskID;
  final String? userID;
  final String? taskName;
  final int? progress;
  final int? goal;
  final bool? isCompleted;

  final int? points;
  final DateTime? lastReset;

  DailyTask(
      {this.taskID,
      this.userID,
      this.taskName,
      this.progress,
      this.goal,
      this.isCompleted,
      this.points,
      this.lastReset});
}

/*
    public int Id { get; set; }
    public string UserId { get; set; } = string.Empty;
    public string TaskName { get; set; } = string.Empty;
    public int Progress { get; set; }
    public int Goal { get; set; }
    public bool IsCompleted { get; set; }

    public int Points { get; set; }
    public DateTime LastReset { get; set; }
*/
