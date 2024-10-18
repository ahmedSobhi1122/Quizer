import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/features/presentation/cubit/setting_cubit.dart';
import 'package:quizer/features/presentation/state/setting_state.dart';
import 'package:themed/themed.dart';
import 'package:quizer/features/data_sources/local/app_prefs.dart';

import '../../../../config/themes/theme.dart';
import '../../../domain/usecases/delete_account_usecase.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String language = 'English';
  String theme = sl<AppPrefs>().getString("theme").toString().toLowerCase();
  String notification = 'On';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    setState(() {
      theme = sl<AppPrefs>().getString('theme') ?? 'light';
      language = sl<AppPrefs>().getString('language') ?? 'English';
      notification = sl<AppPrefs>().getString('notification') ?? 'On';
    });
  }

  void _deleteDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Center(
                child: Text(
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
                      onPressed: () => context.pop(),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        String? id = "deb99e7a-e6fd-4866-b936-a95ab34f4570";
                        String? token =
                            "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJnaXZlbl9uYW1lIjoiQWhtZWQiLCJmYW1pbHlfbmFtZSI6IlNvYmhpIiwiZW1haWwiOiJAZ21haWwuY29tIiwibmJmIjoxNzI5Mjc0MDM5LCJleHAiOjE3MzE5NTYwMzksImlhdCI6MTcyOTI3NDAzOSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2In0.c0W8ChCwZusMl3pNidz79ajGigpiTdJP0-Bg1_8ImQgdW66S4tGxnfm0GtMO6QiDbC4lakwEMQgMI6_fBrriMA";
                        await context.read<DeleteAccountUsecase>().call(id, token);
                      },
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
          title: const Text('Select a Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(Languages.ENGLISH.name),
                onTap: () {
                  _chooseLanguage(Languages.ENGLISH.name);
                },
              ),
              ListTile(
                title: Text(Languages.ARABIC.name),
                onTap: () {
                  _chooseLanguage(Languages.ARABIC.name);
                },
              ),
              ListTile(
                title: Text(Languages.FRENCH.name),
                onTap: () {
                  _chooseLanguage(Languages.FRENCH.name);
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
          title: const Text('Select a Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(Themes.LIGHT.name.toLowerCase()),
                onTap: () {
                  _chooseTheme(Themes.LIGHT.name);
                },
              ),
              ListTile(
                title: Text(Themes.DARK.name.toLowerCase()),
                onTap: () {
                  _chooseTheme(Themes.DARK.name);
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
          title: const Text('Notification State'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(States.ON.name),
                onTap: () {
                  _chooseNotification(States.ON.name);
                },
              ),
              ListTile(
                title: Text(States.OFF.name),
                onTap: () {
                  _chooseNotification(States.OFF.name);
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
                'Welcome to Quizzo! 🎉 A fun and interactive app where you can create your own mini quizzes, challenge yourself across various topics, and compete with friends like never before. With engaging questions in multiple fields and a game-like competitive experience, Quizzo turns learning into a fun challenge. Ready to test your knowledge and have some fun? Let the quiz battle begin!',
                style: TextStyle(color: Colors.black),
              ),
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
    if (theme == Themes.LIGHT.name) {
      sl<AppPrefs>().setString("theme", Themes.LIGHT.name);
      Themed.currentTheme = LightTheme;
    } else if (theme == Themes.DARK.name) {
      sl<AppPrefs>().setString("theme", Themes.DARK.name);
      Themed.currentTheme = DarkTheme;
    } else {
      Themed.currentTheme = BlueTheme;
    }
    setState(() {
      this.theme = theme;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SettingScreen()),
      );
    });
  }

  void _chooseLanguage(String language) {
    sl<AppPrefs>().setString("language", language);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You selected $language')),
    );
    setState(() {
      this.language = language;
    });
  }

  void _chooseNotification(String notification) {
    sl<AppPrefs>().setString("notification", notification);
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
          padding: EdgeInsets.all(AppPadding.p16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Setting",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyTheme.textColor,
                  fontSize: AppSize.s32,
                ),
              ),
              SizedBox(height: 20.h),
              const Text(
                "Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyTheme.textColor,
                  fontSize: AppSize.s22,
                ),
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: const Text(
                  "Edit Personal Info",
                  style: TextStyle(
                    color: MyTheme.textColor,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: MyTheme.textColor,
                ),
                onTap: () {
                  print("Edit Personal Info");
                  context.pushNamed(Routes.profileScreenRoute);
                },
              ),
              SizedBox(height: 10.h),
              BlocListener<SettingCubit, SettingState>(
                listener: (BuildContext context, SettingState state) {
                  if (state is SettingSuccess) {
                    context.pushReplacementNamed(Routes.logInScreenRoute);
                  }
                  print(state);
                },
                child: ListTile(
                  title: const Text(
                    "Delete Account",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: MyTheme.textColor),
                  onTap: () {
                    _deleteDialog();
                    print("Delete Account");
                  },
                ),
              ),
              SizedBox(height: 20.h),
              const Text(
                "General",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyTheme.textColor,
                  fontSize: AppSize.s22,
                ),
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: const Text(
                  "Theme",
                  style: TextStyle(
                    color: MyTheme.textColor,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      theme,
                      style: const TextStyle(
                        fontSize: AppSize.s14,
                        color: MyTheme.textColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Icon(Icons.arrow_forward_ios,
                        color: MyTheme.textColor)
                  ],
                ),
                onTap: () {
                  print("Theme");
                  _themeDialog();
                },
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: const Text(
                  "Language",
                  style: TextStyle(
                    color: MyTheme.textColor,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      language,
                      style: const TextStyle(
                          fontSize: AppSize.s14, color: MyTheme.textColor),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Icon(Icons.arrow_forward_ios,
                        color: MyTheme.textColor)
                  ],
                ),
                onTap: () {
                  print("Language");
                  _languageDialog();
                },
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: const Text(
                  "Notification",
                  style: TextStyle(
                    color: MyTheme.textColor,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      notification,
                      style: const TextStyle(
                          fontSize: AppSize.s14, color: MyTheme.textColor),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Icon(Icons.arrow_forward_ios,
                        color: MyTheme.textColor)
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
                  color: MyTheme.textColor,
                  fontSize: AppSize.s22,
                ),
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: const Text(
                  "About Quizzo",
                  style: TextStyle(
                    color: MyTheme.textColor,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: MyTheme.textColor),
                onTap: () {
                  print("About");
                  _aboutDialog();
                },
              ),
              const Spacer(),
              Divider(
                height: 50.h,
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: MyTheme.textColor,
                  ),
                ),
                trailing: const Icon(Icons.logout, color: MyTheme.textColor),
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
