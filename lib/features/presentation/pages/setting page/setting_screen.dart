import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/config/routes/route_constants.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

enum Themes { Light, Dark }

enum Languages { English, Arabic, French }

enum States { On, Off }

class _SettingScreenState extends State<SettingScreen> {
  String language = 'English';
  String theme = 'Light';
  String notification = 'On';

  void _deleteDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(
                child: const Text(
                  'Delete Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              content: const Text(
                  'Are you sure you want to delete your account? This action is irreversible, and all your data will be permanently removed.'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                )
              ],
            ));
  }

  void _languageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(Languages.English.name),
                onTap: () {
                  _chooseLanguage(Languages.English.name);
                },
              ),
              ListTile(
                title: Text(Languages.Arabic.name),
                onTap: () {
                  _chooseLanguage(Languages.Arabic.name);
                },
              ),
              ListTile(
                title: Text(Languages.French.name),
                onTap: () {
                  _chooseLanguage(Languages.French.name);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _themeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(Themes.Light.name),
                onTap: () {
                  _chooseTheme(Themes.Light.name);
                },
              ),
              ListTile(
                title: Text(Themes.Dark.name),
                onTap: () {
                  _chooseTheme(Themes.Dark.name);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _notificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification State'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(States.On.name),
                onTap: () {
                  _chooseNotification(States.On.name);
                },
              ),
              ListTile(
                title: Text(States.Off.name),
                onTap: () {
                  _chooseNotification(States.Off.name);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _aboutDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('About Quizzo'),
              content: const Text(
                  'Welcome to Quizzo! 🎉 A fun and interactive app where you can create your own mini quizzes, challenge yourself across various topics, and compete with friends like never before. With engaging questions in multiple fields and a game-like competitive experience, Quizzo turns learning into a fun challenge. Ready to test your knowledge and have some fun? Let the quiz battle begin!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok'),
                ),
              ],
            ));
  }

  void _logoutDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Center(
            child: Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: const Text('Are you sure you want to Logout?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  void _chooseTheme(String theme) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You selected $theme')),
    );
    setState(() {
      this.theme = theme;
    });
  }

  void _chooseLanguage(String language) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You selected $language')),
    );
    setState(() {
      this.language = language;
    });
  }

  void _chooseNotification(String notification) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You selected $notification')),
    );
    setState(() {
      this.notification = notification;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Setting",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: AppSize.s32,
                ),
              ),
              SizedBox(height: 20.h),
              const Text(
                "Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: AppSize.s22,
                ),
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: Text("Edit Personal Info"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print("Edit Personal Info");
                  context.pushNamed(Routes.profileScreenRoute);
                },
              ),
              SizedBox(height: 10.h),
              ListTile(
                textColor: Colors.red,
                title: Text("Delete Account"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _deleteDialog();
                  print("Delete Account");
                },
              ),
              SizedBox(height: 20.h),
              const Text(
                "General",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: AppSize.s22,
                ),
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: Text("Theme"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      theme,
                      style: const TextStyle(
                        fontSize: AppSize.s14,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                onTap: () {
                  print("Theme");
                  _themeDialog();
                },
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: Text("Language"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      language,
                      style: const TextStyle(
                        fontSize: AppSize.s14,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                onTap: () {
                  print("Language");
                  _languageDialog();
                },
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: const Text("Notification"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      notification,
                      style: const TextStyle(
                        fontSize: AppSize.s14,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                onTap: () {
                  _notificationDialog();
                  print("Notification");
                },
              ),
              SizedBox(height: 20.h),
              const Text(
                "About",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: AppSize.s22,
                ),
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: const Text("About Quizzo"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print("About");
                  _aboutDialog();
                },
              ),
              Spacer(),
              Divider(
                height: 50.h,
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: const Text("Logout"),
                trailing: const Icon(Icons.logout),
                splashColor: Colors.red[400],
                onTap: () {
                  print("Logout");
                  _logoutDialog();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
