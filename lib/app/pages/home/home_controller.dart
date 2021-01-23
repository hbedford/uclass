import 'package:flutter/cupertino.dart';
import 'package:uclass/domain/entities/menu.dart';
import 'package:uclass/domain/entities/school.dart';
import 'package:uclass/domain/entities/team.dart';

class HomeController {
  final school = ValueNotifier<School>(null);
  final team = ValueNotifier<Team>(null);
  final teams = ValueNotifier<List>([]);
  final page = ValueNotifier<int>(1);
  final menu = ValueNotifier<List<Menu>>([
    Menu(
      id: 0,
      name: 'MEU DASH',
    ),
    Menu(
      id: 1,
      name: 'SALAS',
    ),
    Menu(id: 2, name: 'SOCIAL'),
    Menu(id: 3, name: 'CALENDARIO')
  ]);

  changeTeam(Team t) => team.value = t;
  changeTeams(List<Team> t) => teams.value = t;
  addTeam(Team t) => teams.value.add(t);
  removeTeam(Team t) => teams.value.remove(t);
  changePage(int i) => page.value = i;
}
