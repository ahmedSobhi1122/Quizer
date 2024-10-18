import '../../../../config/routes/screen_export.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Screen')),
      body: Center(child: Text('You have navigated to the next screen!')),
    );
  }
}