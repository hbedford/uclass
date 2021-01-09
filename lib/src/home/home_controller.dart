import 'package:flutter/cupertino.dart';
import 'package:uclass/src/models/admin_model.dart';
import 'package:uclass/src/models/school_model.dart';
import 'package:uclass/src/models/team_model.dart';

class HomeController {
  final school = ValueNotifier<SchoolModel>(null);
  final team = ValueNotifier<TeamModel>(null);
  final teams = ValueNotifier<List>([]);
  final admin = ValueNotifier<AdminModel>(null);

  changeTeam(TeamModel t) => team.value = t;
  changeTeams(List<TeamModel> t) => teams.value = t;
  addTeam(TeamModel t) => teams.value.add(t);
  removeTeam(TeamModel t) => teams.value.remove(t);
}
