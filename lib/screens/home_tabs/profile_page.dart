import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pertama/models/login_model.dart';
import 'package:flutter_pertama/screens/login_screen.dart';
import 'package:flutter_pertama/screens/main_screen.dart';

class ProfilePage extends StatelessWidget {
  final LoginModel? loginModel;
  const ProfilePage({super.key, this.loginModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 20,
                    children: [
                      CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                          loginModel != null
                              ? 'https://picsum.photos/200/300'
                              : 'https://dummyimage.com/80/000/fff',
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            loginModel != null ? 'User' : 'Guest',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            loginModel != null
                                ? loginModel!.email
                                : 'You are not logged in',
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(color: Colors.black54),
                          ),
                          const SizedBox(height: 10),
                          loginModel == null
                              ? FilledButton(
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pushNamed(LoginScreen.routeName);
                                  },
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text('Login / Register'),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  onTap: () {},
                  leading: const Icon(CupertinoIcons.settings),
                  title: const Text('Settings'),
                  subtitle: const Text('Theme, Language, etc'),
                  trailing: const Icon(CupertinoIcons.chevron_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(CupertinoIcons.question_circle),
                  title: const Text('About'),
                  subtitle: const Text('Version, Privacy Policy, etc'),
                  trailing: const Icon(CupertinoIcons.chevron_right),
                ),
                const Divider(),
                const SizedBox(height: 10),
                loginModel != null
                    ? ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            MainScreen.routeName,
                            (route) => false,
                          );
                        },
                        leading: const Icon(Icons.logout),
                        title: const Text('Logout'),
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        tileColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
