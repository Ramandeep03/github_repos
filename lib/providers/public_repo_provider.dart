
import 'package:flutter/material.dart';
import 'package:github_repos/constants/urls.dart';
import 'package:github_repos/models/commit_model.dart';
import 'package:github_repos/models/repo_model.dart';
import 'package:github_repos/services/rest_services.dart';

import '../models/user_model.dart';

class PublicRepoProvider extends ChangeNotifier {
  User? currentRepoUser;

  User? get getCurrentRepoUser => currentRepoUser;

  bool loading = true;

  bool get isLoading => loading;

  List<Repos> repoList = [];

  List<Repos> get getRepoList => repoList;

  Map<String, Commit> lastCommits = {};

  Map<String, Commit> get getLastCommit => lastCommits;
  String error = '';
  String get getError => error;

  Future<void> getRepos({String? user}) async {
    error = '';
    loading = true;
    repoList = [];
    String userName = user ?? "Ramandeep03";
    String url = URLS.mainURL + URLS.users + userName + URLS.repos;
    var data = await RestService.get(url);
    if (data.runtimeType == String) {
      error = data;
      loading = false;
      notifyListeners();
      return;
    }
    for (var object in data) {
      currentRepoUser ??= User.fromMap(object['owner']);
      Repos repo = Repos.fromMap(object);
      repoList.add(repo);
    }
    loading = false;
    getLastCommits(userName);
    notifyListeners();
  }

  Future<void> getLastCommits(String userName) async {
    lastCommits = {};
    for (Repos repo in repoList) {
      String url =
          URLS.mainURL + URLS.repoMid + repo.fullName! + URLS.commitEndpoint;
      var data = await RestService.get(url);
      Commit commit = Commit.fromMap(data[0]);
      lastCommits.addAll({repo.id!.toString(): commit});
    }
  }
}
