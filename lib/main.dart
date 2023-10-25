import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scroll_indicator/widgets/banner.dart';
import 'package:scroll_indicator/widgets/content.dart';
import 'package:scroll_indicator/widgets/indicator.dart';

void main() {
  runApp(const BlogView());
}

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReadingView(),
    );
  }
}

class ReadingView extends StatefulWidget {
  const ReadingView({super.key});

  @override
  State<ReadingView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ReadingView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double offset = _scrollController.offset;

      setState(() {
        progressValue = offset / maxScroll;
      });
    });

    super.initState();
  }

  double progressValue = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.save_2),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.share),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_2user),
            label: "",
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              controller: _scrollController,
              children: [
                const BannerImage(),
                Text(
                  "Exploring New York's Hidden Gems. Part II",
                  style: GoogleFonts.cormorant()
                      .copyWith(fontSize: 35, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Content(),
              ],
            ),
          ),
          Indicator(progressValue: progressValue),
        ],
      ),
    );
  }
}
