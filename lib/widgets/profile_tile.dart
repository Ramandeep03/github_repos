import 'package:flutter/material.dart';
import 'package:github_repos/constants/global_colors.dart';
import 'package:github_repos/models/user_model.dart';
import 'package:github_repos/screens/web_view_screen.dart';
import 'package:github_repos/services/navigation_services.dart';

class ProfileTile extends StatelessWidget {
  final User user;
  const ProfileTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        user.name!,
        style: const TextStyle(
          color: GlobalColors.textColor,
          fontSize: 20,
        ),
      ),
      subtitle: GestureDetector(
        onTap: () {
          NavigationService.push(context,
              screen: WebViewScreen(url: user.profileURL!));
        },
        child: Row(
          children: const [
            Text(
              'Visit Profile',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            Icon(
              Icons.link_outlined,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      trailing: CircleAvatar(
        radius: 25,
        backgroundColor: GlobalColors.primary,
        backgroundImage: NetworkImage(user.avatarURL!),
      ),
    );
  }
}
