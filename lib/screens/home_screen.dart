import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_repos/constants/global_colors.dart';
import 'package:github_repos/providers/public_repo_provider.dart';
import 'package:github_repos/widgets/profile_tile.dart';
import 'package:github_repos/widgets/repo_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PublicRepoProvider>(context, listen: false).getRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(FontAwesomeIcons.github),
      ),
      body: Consumer<PublicRepoProvider>(
        builder: (context, repos, child) {
          if (repos.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: GlobalColors.textColor,
                backgroundColor: GlobalColors.textColor.withOpacity(0.5),
                strokeWidth: 2.0,
              ),
            );
          } else if (repos.error.isEmpty) {
            return Column(
              children: [
                ProfileTile(user: repos.currentRepoUser!),
                const Divider(
                  color: GlobalColors.textColor,
                  height: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return RepoTile(repos: repos.repoList[index]);
                        }),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: repos.getRepoList.length))
              ],
            );
          } else {
            return Text(
              repos.error,
              style: const TextStyle(color: Colors.red),
            );
          }
        },
      ),
    );
  }
}
