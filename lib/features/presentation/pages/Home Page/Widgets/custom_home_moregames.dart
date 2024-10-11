import '../../../../../config/routes/screen_export.dart';

class CustomHomeMoreGames extends StatelessWidget {
  static const SliverGridDelegateWithFixedCrossAxisCount gridDelegate =
  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);

  const CustomHomeMoreGames({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 500,
      child: GridView.builder(
        gridDelegate: gridDelegate,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},

            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[300],
              ),
              child: Center(
                child: Text(
                  'Game $index',
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          );
        },
        itemCount: 10, // Number of games to display
      ),
    );
  }
}
