import 'package:flutter/material.dart';
import 'package:wellorgs_website/home/widgets/home_screen_widegts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  String _primaryText = "GLOBAL";
  String _secondaryText = "AGENCY";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateTexts(int selectedItem) {
    setState(() {
      switch (selectedItem) {
        case 1:
          _primaryText = "GLOBAL";
          _secondaryText = "AGENCY";
          break;
        case 2:
          _primaryText = "CREATIVE";
          _secondaryText = "AGENCY";
          break;
        case 3:
          _primaryText = "AI/ML";
          _secondaryText = "AGENCY";
          break;
        default:
          _primaryText = "GLOBAL";
          _secondaryText = "AGENCY";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HoverDropdownText(
              text: "Home",
              items: const ["Home", "App", "New"],
            ),
            const SizedBox(width: 30),
            HoverDropdownText(
              text: "Pages",
              items: const ["Home", "App", "New"],
            ),
            const SizedBox(width: 30),
            HoverDropdownText(
              text: "Portfolio",
              items: const ["Home", "App", "New"],
            ),
            const SizedBox(width: 30),
            HoverDropdownText(
              text: "Blog",
              items: const ["Home", "App", "New"],
            ),
            const SizedBox(width: 30),
            HoverDropdownText(
              text: "Careers",
              items: const ["Home", "App", "New"],
            ),
            const SizedBox(width: 30),
            HoverText(
                text: "Contact Us",
                normalColor: Colors.white,
                hoverColor: const Color.fromRGBO(254, 190, 49, 1),
                fontSize: 14)
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.phone_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HoverText(
                        text: "Support Center",
                        normalColor: Colors.white,
                        hoverColor: const Color.fromRGBO(254, 190, 49, 1),
                        fontSize: 12),
                    const SizedBox(
                      height: 2,
                    ),
                    HoverText(
                        text: "+00-123-456-789",
                        normalColor: Colors.white,
                        hoverColor: Color.fromRGBO(254, 190, 49, 1),
                        fontSize: 14)
                  ],
                ),
                const SizedBox(
                  width: 80,
                ),
                const Icon(Icons.menu, color: Colors.white),
                const SizedBox(width: 30),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Image.network(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.3)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 20,
                      child: Image(
                        image: NetworkImage("assets/logos/welogo.png"),
                        width: 200,
                      )),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 - 50,
                    left: MediaQuery.of(context).size.width / 2 + 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _primaryText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 30,
                    left: MediaQuery.of(context).size.width / 2 + 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _secondaryText,
                          style: TextStyle(
                            color: Color.fromRGBO(254, 190, 49, 1),
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    left: 100,
                    top: 500,
                    child: Text(
                      'Eleifend quam adipiscing vitae proin sagittis nisl rhoncus. Egestas fringilla\n'
                      'phasellus faucibus.scelerisque. Nisl nisi scelerisque eu ultrices vitae auctor\n'
                      'eu augue ut. Facilisis gravida neque convallis a.Phasellus vestibulum lorem\n'
                      ' sed risus ultricies tristique.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 20,
                      top: MediaQuery.of(context).size.height / 2 - 50,
                      child: SocialMediaButtons()),
                  Positioned(
                    right: 20,
                    top: MediaQuery.of(context).size.height / 2 - 30,
                    child: RotatedBox(
                        quarterTurns: 5,
                        child: HoverText(
                            text: "Get in touch",
                            normalColor: Colors.white,
                            hoverColor: Color.fromRGBO(254, 190, 49, 1),
                            fontSize: 14)),
                  ),
                  Positioned(
                    right: 40,
                    bottom: 70,
                    child: Row(
                      children: [
                        CircleAvatarList(
                          items: const [1, 2, 3],
                          onItemSelected: _updateTexts,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 + 150,
                      left: MediaQuery.of(context).size.width / 2 + 170,
                      child: buildAvatar("assets/logos/welogo.png")),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 + 150,
                      left: MediaQuery.of(context).size.width / 2 + 195,
                      child: buildAvatar("assets/logos/welogo.png")),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 + 150,
                      left: MediaQuery.of(context).size.width / 2 + 215,
                      child: buildAvatar("assets/logos/welogo.png")),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 + 150,
                      left: MediaQuery.of(context).size.width / 2 + 235,
                      child: buildAvatar("assets/logos/welogo.png")),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 + 150,
                      left: MediaQuery.of(context).size.width / 2 + 300,
                      child: const Text(
                        "Happy Customers",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 + 175,
                      left: MediaQuery.of(context).size.width / 2 + 300,
                      child: buildStar()),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 + 175,
                      left: MediaQuery.of(context).size.width / 2 + 320,
                      child: buildStar()),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 + 175,
                      left: MediaQuery.of(context).size.width / 2 + 340,
                      child: buildStar()),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 + 175,
                      left: MediaQuery.of(context).size.width / 2 + 360,
                      child: buildStar()),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 + 175,
                      left: MediaQuery.of(context).size.width / 2 + 380,
                      child: buildStar()),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 + 175,
                      left: MediaQuery.of(context).size.width / 2 + 420,
                      child: const Text(
                        "4.8 (15k reviews)",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9 - 30,
            ),
            const CompanyLogosWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9 - 50,
            ),
            const TalkTogetherSection(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9 - 30,
            ),
            const Text.rich(TextSpan(
                text: "The ",
                style: TextStyle(fontSize: 25),
                children: <TextSpan>[
                  TextSpan(
                      text: "world's most innovative ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "brands work with "),
                  TextSpan(
                      text: "Wellorgs Infotech Pvt Ltd",
                      style: TextStyle(fontWeight: FontWeight.bold))
                ])),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9 - 50,
            ),
            ScrollingLogos(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9 - 30,
            ),
            const AgencyServicesWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9 - 60,
            ),
            const ProcessWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9 - 60,
            ),
            LogoGrid(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9 - 60,
            ),
            ReviewsWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9 - 60,
            ),
            const WhyWorkWithWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9 - 60,
            ),
            AwardsLayout(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9 - 60,
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
