import 'package:flutter/material.dart';
import 'package:github_repos/constants/global_colors.dart';
import 'package:github_repos/models/commit_model.dart';
import 'package:github_repos/models/repo_model.dart';
import 'package:github_repos/providers/public_repo_provider.dart';
import 'package:github_repos/screens/web_view_screen.dart';
import 'package:github_repos/services/navigation_services.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailScreen extends StatelessWidget {
  final Repos repos;
  const DetailScreen({Key? key, required this.repos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Repo Detail',
          style: TextStyle(
            color: GlobalColors.textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<PublicRepoProvider>(
          builder: (context, repo, child) {
            Commit commit = repo.getLastCommit[repos.id.toString()]!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      NavigationService.push(context,
                          screen: WebViewScreen(url: repos.url!));
                    },
                    child: Text(
                      repos.fullName!,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  repos.description!.isNotEmpty
                      ? Text(
                          repos.description!,
                          style: const TextStyle(
                            color: GlobalColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: repos.description!.isNotEmpty ? 10 : 0,
                  ),
                  Row(
                    children: [
                      repos.language!.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GlobalColors.textColor,
                                  width: 0.5,
                                ),
                              ),
                              child: Text(
                                repos.language!,
                                style: const TextStyle(
                                  color: GlobalColors.textColor,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        width: repos.language!.isNotEmpty ? 15 : 0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: GlobalColors.textColor,
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          "Forks : ${repos.forks!}",
                          style: const TextStyle(
                            color: GlobalColors.textColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: GlobalColors.textColor,
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          "Open Issues : ${repos.openIssues!}",
                          style: const TextStyle(
                            color: GlobalColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Updated ${timeago.format(DateTime.parse(repos.updatedAt!))}",
                    style: const TextStyle(
                      color: GlobalColors.textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Divider(
                    height: 1.0,
                    color: GlobalColors.textColor,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "Last Commit",
                    style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Author : ${commit.authorName!}",
                    style: const TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Author Email : ${commit.authorEmail}",
                    style: const TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Message : ${commit.message}",
                    style: const TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Commit Date : ${timeago.format(DateTime.parse(commit.commitDate!))}",
                    style: const TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      NavigationService.push(context,
                          screen: WebViewScreen(url: commit.url!));
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Visit',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        Icon(
                          Icons.link_outlined,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
