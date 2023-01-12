import 'package:flutter/material.dart';
import 'package:github_repos/constants/global_colors.dart';
import 'package:github_repos/models/repo_model.dart';
import 'package:github_repos/screens/detail_screen.dart';
import 'package:github_repos/screens/web_view_screen.dart';
import 'package:github_repos/services/navigation_services.dart';
import 'package:timeago/timeago.dart' as timeago;

class RepoTile extends StatelessWidget {
  final Repos repos;
  const RepoTile({Key? key, required this.repos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.push(context, screen: DetailScreen(repos: repos));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: GlobalColors.textColor,
            width: 0.2,
          ),
        ),
        child: ListTile(
          title: GestureDetector(
            onTap: () {
              NavigationService.push(context,
                  screen: WebViewScreen(url: repos.url!));
            },
            child: Text(
              repos.name!,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 19),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  width: repos.language!.isNotEmpty ? 10.0 : 0.0,
                ),
                Text(
                  "Updated ${timeago.format(DateTime.parse(repos.updatedAt!))}",
                  style: const TextStyle(
                    color: GlobalColors.textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
