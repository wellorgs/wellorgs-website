import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SocialMediaButtons extends StatefulWidget {
  @override
  _SocialMediaButtonsState createState() => _SocialMediaButtonsState();
}

class _SocialMediaButtonsState extends State<SocialMediaButtons> {
  final List<IconData> icons = [
    FontAwesomeIcons.instagram,
    FontAwesomeIcons.x,
    Icons.facebook,
    Icons.email_outlined,
  ];

  final List<bool> hoverStates = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(icons.length, (index) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              hoverStates[index] = true;
            });
          },
          onExit: (_) {
            setState(() {
              hoverStates[index] = false;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: Icon(
                icons[index],
                color: hoverStates[index] ? Colors.blue : Color(0xffFEBE31),
              ),
              onPressed: () {},
            ),
          ),
        );
      }),
    );
  }
}

class HoverDropdownText extends StatefulWidget {
  final String text;
  final List<String> items;

  HoverDropdownText({required this.text, required this.items});

  @override
  _HoverDropdownTextState createState() => _HoverDropdownTextState();
}

class _HoverDropdownTextState extends State<HoverDropdownText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: PopupMenuButton<String>(
        onSelected: (value) {
          // Handle item selection
          print(value);
        },
        itemBuilder: (BuildContext context) {
          return widget.items.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: _isHovered
                    ? Color.fromRGBO(254, 190, 49, 1)
                    : const Color.fromARGB(255, 255, 255, 255),
                fontSize: 14,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: _isHovered
                  ? Color.fromRGBO(254, 190, 49, 1)
                  : const Color.fromARGB(255, 255, 255, 255),
              size: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class CircleAvatarList extends StatefulWidget {
  final List<int> items;
  final ValueChanged<int> onItemSelected;

  CircleAvatarList({required this.items, required this.onItemSelected});

  @override
  _CircleAvatarListState createState() => _CircleAvatarListState();
}

class _CircleAvatarListState extends State<CircleAvatarList> {
  int? selectedItem = 1;
  int? hoveredItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.items.map((item) {
        bool isSelected = item == selectedItem;
        bool isHovered = item == hoveredItem;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedItem = item;
            });
            widget.onItemSelected(item);
            // Return the text value here
            print('Clicked item: $item');
          },
          child: MouseRegion(
            onEnter: (_) {
              setState(() {
                hoveredItem = item;
              });
            },
            onExit: (_) {
              setState(() {
                hoveredItem = null;
              });
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: CircleAvatar(
                backgroundColor: isSelected || isHovered
                    ? Color.fromRGBO(254, 190, 49, 1)
                    : (isHovered ? Colors.grey : Colors.white),
                radius: 20,
                child: Text(
                  item.toString(),
                  style: TextStyle(
                    color:
                        isSelected || isHovered ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class HoverText extends StatefulWidget {
  final String text;
  final Color normalColor;
  final Color hoverColor;
  final double fontSize;

  HoverText({
    required this.text,
    required this.normalColor,
    required this.hoverColor,
    required this.fontSize,
  });

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Text(
        widget.text,
        style: TextStyle(
          color: _isHovered ? widget.hoverColor : widget.normalColor,
          fontSize: widget.fontSize,
        ),
      ),
    );
  }
}

Widget buildAvatar(String url) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 4.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: 2),
    ),
    child: CircleAvatar(
      backgroundImage: NetworkImage(url),
      backgroundColor: Colors.grey,
      radius: 20,
    ),
  );
}

Widget buildStar() {
  return Icon(
    Icons.star,
    color: Color.fromRGBO(254, 190, 49, 1),
    size: 20,
  );
}

class CompanyLogosWidget extends StatelessWidget {
  const CompanyLogosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.network(
              "https://cdn.shopify.com/s/files/1/0695/0102/6588/files/review.svg?v=1672113906"),
          SvgPicture.network(
              "https://cdn.shopify.com/s/files/1/0695/0102/6588/files/shopify_plus.svg?v=1672113906"),
          SvgPicture.network(
              "https://cdn.shopify.com/s/files/1/0695/0102/6588/files/google.svg?v=1672113906"),
          SvgPicture.network(
              "https://cdn.shopify.com/s/files/1/0695/0102/6588/files/trustpilot.svg?v=1672113907"),
          SvgPicture.network(
              "https://cdn.shopify.com/s/files/1/0695/0102/6588/files/clutch.svg?v=1672113906"),
          SvgPicture.network(
              "https://cdn.shopify.com/s/files/1/0695/0102/6588/files/shopify.svg?v=1672113907"),
        ],
      ),
    );
  }
}

class TalkTogetherSection extends StatelessWidget {
  const TalkTogetherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 240, 206, 1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: const Text.rich(
                    TextSpan(
                      text: ' Let’s get together and ',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'talk',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' about\n ',
                        ),
                        TextSpan(
                          text: 'customizing',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' your Shopify theme,\n or ',
                        ),
                        TextSpan(
                          text: 'building a new store',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' from \n scratch.',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 350,
                  width: 500,
                  child: GridView(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0.5,
                      crossAxisSpacing: 0.5,
                      childAspectRatio: 1.6,
                    ),
                    children: const [
                      InfoCard(
                        iconPath:
                            'https://cdn.shopify.com/s/files/1/0695/0102/6588/files/monitor.svg?v=1672114744',
                        title: '300+',
                        description: 'Projects',
                        border: Border(
                          bottom: BorderSide(width: 0.5, color: Colors.black),
                          right: BorderSide(width: 0.5, color: Colors.black),
                        ),
                      ),
                      InfoCard(
                        iconPath:
                            'https://cdn.shopify.com/s/files/1/0695/0102/6588/files/money-bag.svg?v=1672114744',
                        title: '150+',
                        description: 'Global clients',
                        border: Border(
                          bottom: BorderSide(width: 0.5, color: Colors.black),
                          left: BorderSide(width: 0.5, color: Colors.black),
                        ),
                      ),
                      InfoCard(
                        iconPath:
                            'https://cdn.shopify.com/s/files/1/0695/0102/6588/files/banners.svg?v=1672114744',
                        title: '550+',
                        description: 'Five Star Reviews',
                        border: Border(
                          top: BorderSide(width: 0.5, color: Colors.black),
                          right: BorderSide(width: 0.5, color: Colors.black),
                        ),
                      ),
                      InfoCard(
                        iconPath:
                            'https://cdn.shopify.com/s/files/1/0695/0102/6588/files/award.svg?v=1672114744',
                        title: '40+',
                        description: 'Awards for Arctic Grey',
                        border: Border(
                          top: BorderSide(width: 0.5, color: Colors.black),
                          left: BorderSide(width: 0.5, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: const ScheduleMeetingButton(),
                )
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/images/gifimages.gif",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final Border border;

  const InfoCard({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.network(
          //   iconPath,
          //   height: 50,
          //   width: 50,
          // ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center, // Center align text
          ),
        ],
      ),
    );
  }
}

class ScheduleMeetingButton extends StatelessWidget {
  const ScheduleMeetingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 290,
        height: 55,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(0, 48, 96, 1))),
        child: const Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Schedule a meeting",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 48, 96, 1)),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.arrow_forward,
                color: Color.fromRGBO(0, 48, 96, 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollingLogos extends StatefulWidget {
  @override
  _ScrollingLogosState createState() => _ScrollingLogosState();
}

class _ScrollingLogosState extends State<ScrollingLogos>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _animationController;

  final List<String> _logos = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png",
    "assets/images/10.png",
    "assets/images/11.png",
    "assets/images/12.png",
    "assets/images/13.png",
    "assets/images/14.png",
    "assets/images/15.png",
    "assets/images/16.png",
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..addListener(_scrollListener);

    _animationController.repeat();
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.offset + 1);
    }
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      _scrollController.jumpTo(0);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: _logos.length * 2,
        itemBuilder: (context, index) {
          final logoIndex = index % _logos.length;
          return Container(
            height: 100,
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Image.asset(
              _logos[logoIndex],
              height: 50,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}

class ExpandingCardList extends StatefulWidget {
  @override
  _ExpandingCardListState createState() => _ExpandingCardListState();
}

class _ExpandingCardListState extends State<ExpandingCardList> {
  int _expandedIndex = 0;

  final List<CardItem> items = [
    CardItem(
      title: 'App Development',
      image: 'assets/images/appdev.png',
      description:
          'Quisque id diam vel quam elementum. Mauris a diam maecenas sed enim ut.',
    ),
    CardItem(
      title: 'Website Development',
      image: 'assets/images/graphic.png',
      description:
          'Tincidunt ornare massa eget egestas purus viverra. Ultrices eros in cursus turpis.',
    ),
    CardItem(
      title: 'Custom AI Development',
      image: 'assets/images/custom.png',
      description:
          'Eros in cursus turpis massa tincidunt dui. Tincidunt ornare massa eget egestas purus.',
    ),
    CardItem(
      title: 'Branding & Marketing',
      image: 'assets/images/marketing.png',
      description:
          'Cursus turpis massa tincidunt dui. Ultrices eros in cursus turpis massa tincidunt.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.asMap().entries.map((entry) {
        int index = entry.key;
        CardItem item = entry.value;
        return ExpandedCard(
          item: item,
          isExpanded: _expandedIndex == index,
          onHover: () => _setHover(index),
        );
      }).toList(),
    );
  }

  void _setHover(int index) {
    setState(() {
      _expandedIndex = index;
    });
  }
}

class CardItem {
  final String title;
  final String image;
  final String description;

  CardItem({
    required this.title,
    required this.image,
    required this.description,
  });
}

class ExpandedCard extends StatelessWidget {
  final CardItem item;
  final bool isExpanded;
  final VoidCallback onHover;

  const ExpandedCard({
    required this.item,
    required this.isExpanded,
    required this.onHover,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(),
      child: AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        duration: Duration(milliseconds: 300),
        width: isExpanded ? 500 : 300,
        height: 500,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            if (isExpanded)
              BoxShadow(
                color: Colors.black26,
                blurRadius: 20,
                spreadRadius: 1,
              )
          ],
          image: DecorationImage(
            image: NetworkImage(item.image),
            fit: BoxFit.cover,
            colorFilter: isExpanded
                ? ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken)
                : null,
          ),
        ),
        child: isExpanded
            ? Padding(
                padding: const EdgeInsets.all(0),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          width: 300,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.circular(-8),
                                  bottomLeft: Radius.zero,
                                  bottomRight: Radius.circular(8))),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 100,
                      top: 300,
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          item.description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 100,
                      top: 400,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Know More',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Container(
                        width: 300,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.zero,
                                topRight: Radius.circular(-8),
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.circular(8))),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class AgencyServicesWidget extends StatelessWidget {
  const AgencyServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height + 250,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          const Positioned(
              top: 100,
              left: 10,
              child: Text(
                "AGENCY SERVICES",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange),
              )),
          const Positioned(
              left: 10,
              top: 150,
              child: Text(
                "Our Strategy & Patented Technology\nServe As Our Driving Force.",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    color: Color.fromRGBO(0, 48, 96, 1)),
              )),
          Positioned(
              top: 90,
              left: MediaQuery.of(context).size.width / 2 + 50,
              child: const CircleAvatar(
                radius: 90,
                backgroundColor: Color.fromRGBO(228, 228, 228, 1),
              )),
          Positioned(
              top: 140,
              left: MediaQuery.of(context).size.width / 2 + 110,
              child: SizedBox(
                width: 500,
                child: Text(
                  "Nibh praesent tristique magna sit. Aliquam etiam erat velit scelerisque in dictum. Justo donec enim diam vulputate. Leo integer malesuada nunc vel.",
                  softWrap: true,
                  style: TextStyle(fontSize: 18),
                ),
              )),
          Positioned(
            left: 10,
            top: 340,
            right: 10,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ExpandingCardList(),
            ),
          )
        ],
      ),
    );
  }
}

class AutoScrollList extends StatefulWidget {
  @override
  _AutoScrollListState createState() => _AutoScrollListState();
}

class _AutoScrollListState extends State<AutoScrollList> {
  final ScrollController _scrollController = ScrollController();
  final double itemHeight = 200.0;
  final int itemCount = 5;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    Future.delayed(Duration(seconds: 2), () {
      if (_scrollController.hasClients) {
        _currentIndex++;
        if (_currentIndex >= itemCount) {
          _currentIndex = 0;
        }
        _scrollController
            .animateTo(
              _currentIndex * itemHeight,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            )
            .then((_) => _startAutoScroll());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ProcessItem(
            iconUrl: _getIconUrl(index),
            title: _getTitle(index),
            description: _getDescription(index),
          );
        },
      ),
    );
  }

  String _getIconUrl(int index) {
    switch (index) {
      case 0:
        return 'https://cdn.shopify.com/s/files/1/0695/0102/6588/files/plan.svg?v=1702635098';
      case 1:
        return 'https://cdn.shopify.com/s/files/1/0695/0102/6588/files/design.svg?v=1702635098';
      case 2:
        return 'https://cdn.shopify.com/s/files/1/0695/0102/6588/files/develop.svg?v=1702635098';
      case 3:
        return 'https://cdn.shopify.com/s/files/1/0695/0102/6588/files/deploy.svg?v=1702635098';
      case 4:
        return 'https://cdn.shopify.com/s/files/1/0695/0102/6588/files/ab-testing.svg?v=1702635098';
      default:
        return '';
    }
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Plan';
      case 1:
        return 'Design';
      case 2:
        return 'Develop';
      case 3:
        return 'Deploy';
      case 4:
        return 'A/B Testing';
      default:
        return '';
    }
  }

  String _getDescription(int index) {
    switch (index) {
      case 0:
        return 'They say an idiot with a plan can beat a genius without a plan.\n'
            'But what if we can do both? Team up with Arctic Grey &\n'
            'get paired with your new team that specializes in all\n'
            'things Commerce,and create a plan of action for world domination.\n';
      case 1:
        return 'Steve Jobs said design is not just what it looks like and feels like.\n'
            'Design is how it works.\n'
            'Partner with Arctic Grey to build an intuitive user experience\n'
            'designed to improve conversion rates & average order values.\n';
      case 2:
        return "Your online store is the heart of your business - \n"
            "don't let bad development slow you down. \n"
            "Let our Shopify experts take the reins on development\n"
            "so you can focus on your customer experience, not your back end.\n";
      case 3:
        return 'We have created a deployment process to launch everything\n'
            'from complex feature upgrades to brand new site builds via Github\n'
            'for perfect version control.\n'
            'No more, “oops! that update broke something on the live site!”.\n';
      case 4:
        return "Take the guess work out of everything!\n"
            "A/B Testing is the cheat code to success.\n"
            "Let us help you make decisions backed by data,\n"
            "showing you what changes actually work and what doesn't.\n";
      default:
        return '';
    }
  }
}

class ProcessItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String description;

  ProcessItem({
    required this.iconUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.network(
            iconUrl,
            height: 50,
            width: 50,
            placeholderBuilder: (context) => CircularProgressIndicator(),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            softWrap: true,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class ProcessWidget extends StatelessWidget {
  const ProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Our Process",
            style: TextStyle(color: Color.fromRGBO(0, 46, 98, 1), fontSize: 48),
          ),
          const SizedBox(
            height: 50,
          ),
          AutoScrollList()
        ],
      ),
    );
  }
}

class LogoGrid extends StatefulWidget {
  @override
  _LogoGridState createState() => _LogoGridState();
}

class _LogoGridState extends State<LogoGrid> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1,
        height: screenHeight + 800,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
          ),
          itemCount: 25,
          itemBuilder: (context, index) {
            bool isCenter = index == 12;
            double scale = isCenter
                ? (1 + (_scrollController.offset / screenHeight))
                : 1.0;

            if (isCenter) {
              scale = scale.clamp(1.0, 1.5);
            }

            return Transform.scale(
              scale: scale,
              child: Container(
                height: 50,
                width: 150,
                padding: EdgeInsets.all(isCenter ? 0 : 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(113, 0, 0, 0), width: 0.5)),
                child: isCenter
                    ? Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          child: Image.asset(
                            'assets/Wellorgs-logo-white.png',
                            height: 500,
                            width: 100,
                          ),
                        ),
                      )
                    : Image.asset(
                        getLogoUrl(index),
                        height: 700,
                        width: 400,
                      ),
              ),
            );
          },
        ),
      ),
    );
  }

  String getLogoUrl(int index) {
    List<String> urls = [
      'assets/logo1.png',
      'assets/logo2.png',
      'assets/logo3.png',
      'assets/logo4.png',
      'assets/logo5.png',
      'assets/logo6.png',
      'assets/logo7.png',
      'assets/logo8.png',
      'assets/logo9.png',
      'assets/logo10.png',
      'assets/logo11.png',
      'assets/logo12.png',
      'assets/images/Wellorgs-logo-white.png',
      'assets/logo13.png',
      'assets/logo14.png',
      'assets/logo15.png',
      'assets/logo16.png',
      'assets/logo17.png',
      'assets/logo18.png',
      'assets/logo19.png',
      'assets/logo20.png',
      'assets/logo21.png',
      'assets/logo22.png',
      'assets/logo23.png',
      'assets/logo24.png',
    ];
    return urls[index % urls.length];
  }
}

class ReviewsWidget extends StatefulWidget {
  @override
  _ReviewsWidgetState createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final List<Map<String, String>> _reviews = [
    {
      'image': 'assets/images/Mask group.png',
      'review':
          'Arctic Grey: Rescuing The Cashmere Sale with Shopify Plus Development',
      'text':
          'Arctic Grey\'s swift intervention was a game-changer for The Cashmere Sale. We found ourselves in a precarious situation when our previous developers abruptly abandoned our custom website project. Thankfully, Arctic Grey seamlessly stepped in, picking up where others left off without a hitch. Their ability to troubleshoot and address our challenges was nothing short of impressive, giving us renewed confidence in the project\'s success.',
      'author': 'Samantha Ferrogario',
      'role': 'Assistant Director of Stores & Operations at The Cashmere Sale'
    },
    {
      'image': 'assets/images/Mask group1.png',
      'review': 'Arctic Grey: An Amazing Experience',
      'text':
          'Their incredible attention to detail and project dedication left us in awe. Timeliness and communication were unparalleled throughout our partnership, ensuring that every step of the way, we felt well-informed and supported. Arctic Grey\'s commitment to our project blew away our expectations, and we are now on year five of our continued collaboration.',
      'author': 'John Doe',
      'role': 'CEO at Company XYZ'
    },
    {
      'image': 'assets/images/Mask group2.png',
      'review': 'Arctic Grey: An Amazing Experience',
      'text':
          'Their incredible attention to detail and project dedication left us in awe. Timeliness and communication were unparalleled throughout our partnership, ensuring that every step of the way, we felt well-informed and supported. Arctic Grey\'s commitment to our project blew away our expectations, and we are now on year five of our continued collaboration.',
      'author': 'John Doe',
      'role': 'CEO at Company XYZ'
    },
    {
      'image': 'assets/images/Mask group3.png',
      'review': 'Arctic Grey: An Amazing Experience',
      'text':
          'Their incredible attention to detail and project dedication left us in awe. Timeliness and communication were unparalleled throughout our partnership, ensuring that every step of the way, we felt well-informed and supported. Arctic Grey\'s commitment to our project blew away our expectations, and we are now on year five of our continued collaboration.',
      'author': 'John Doe',
      'role': 'CEO at Company XYZ'
    },
    {
      'image': 'assets/images/Mask group4.png',
      'review': 'Arctic Grey: An Amazing Experience',
      'text':
          'Their incredible attention to detail and project dedication left us in awe. Timeliness and communication were unparalleled throughout our partnership, ensuring that every step of the way, we felt well-informed and supported. Arctic Grey\'s commitment to our project blew away our expectations, and we are now on year five of our continued collaboration.',
      'author': 'John Doe',
      'role': 'CEO at Company XYZ'
    },
  ];

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animationController.forward();
  }

  void _nextReview() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _reviews.length;
      _animationController.reset();
      _animationController.forward();
    });
  }

  void _previousReview() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _reviews.length) % _reviews.length;
      _animationController.reset();
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: MediaQuery.of(context).size.width - 200,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 5.0,
          )
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 60, 40, 60),
            child: Row(
              children: [
                Container(
                  height: 470,
                  width: 380,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      _reviews[_currentIndex]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 470,
                    child: FadeTransition(
                      opacity: _animation,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(5, (index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 25,
                              );
                            }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            _reviews[_currentIndex]['review']!,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _reviews[_currentIndex]['text']!,
                            style: TextStyle(fontSize: 14),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/150'), // Replace with actual image URL
                                radius: 20,
                              ),
                              SizedBox(width: 8.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _reviews[_currentIndex]['author']!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    _reviews[_currentIndex]['role']!,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: -24,
            top: 0.0,
            bottom: 0.0,
            child: Center(
              child: IconButton.filled(
                style: IconButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(
                        side: BorderSide(width: 3, color: Colors.white))),
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                iconSize: 24.0,
                onPressed: _previousReview,
                padding: const EdgeInsets.all(12.0),
                constraints: const BoxConstraints(
                  minWidth: 48.0,
                  minHeight: 48.0,
                ),
                // decoration: BoxDecoration(
                //   color: Colors.black,
                //   shape: BoxShape.circle,
                //   border: Border.all(color: Colors.white, width: 2),
                // ),
              ),
            ),
          ),
          Positioned(
            right: -24,
            top: 0.0,
            bottom: 0.0,
            child: Center(
              child: IconButton.filled(
                style: IconButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(
                        side: BorderSide(width: 3, color: Colors.white))),
                icon: Icon(Icons.arrow_forward),
                color: Colors.white,
                iconSize: 24.0,
                onPressed: _nextReview,
                padding: const EdgeInsets.all(12.0),
                constraints: const BoxConstraints(
                  minWidth: 48.0,
                  minHeight: 48.0,
                ),
                // decoration: BoxDecoration(
                //   color: Colors.black,
                //   shape: BoxShape.circle,
                //   border: Border.all(color: Colors.white, width: 2),
                // ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: PageController(initialPage: _currentIndex),
                count: _reviews.length,
                effect: const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.orange,
                  dotColor: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhyWorkWithWidget extends StatelessWidget {
  const WhyWorkWithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Why work with",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 20,
        ),
        Image.network(
          "assets/logos/logow.png",
          width: 30,
          height: 30,
        ),
        const SizedBox(
          width: 20,
        ),
        ScrollingTextWidget()
      ],
    );
  }
}

class ScrollingTextWidget extends StatefulWidget {
  @override
  _ScrollingTextWidgetState createState() => _ScrollingTextWidgetState();
}

class _ScrollingTextWidgetState extends State<ScrollingTextWidget>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _animationController;

  final List<String> _texts = [
    'Technology',
    'Cost-Effective',
    'Fresh Ideas',
    'Full-service',
    'Technology',
    'Unsurpassed Quality',
    '100% Client Satisfaction'
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..addListener(_scrollListener);

    _animationController.repeat();
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.offset + 1);
    }
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      _scrollController.jumpTo(0);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width - 400,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: _texts.length * 2,
        itemBuilder: (context, index) {
          final textIndex = index % _texts.length;
          return Row(
            children: [
              Text(
                _texts[textIndex],
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              if (index < _texts.length * 2 - 1)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.circle,
                    color: Colors.yellow,
                    size: 8.0,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class AwardsLayout extends StatelessWidget {
  final List<Map<String, String>> awards = [
    {
      'image':
          'https://arcticgrey.com/cdn/shop/files/best-designrush.png?v=1703763182',
      'title': 'Best Website Design 2022'
    },
    {
      'image':
          'https://arcticgrey.com/cdn/shop/files/expertise_f69c262b-9692-4d07-9d0d-92f9b1dbf894.png?v=1703763471',
      'title': 'Best Web Developers in New York'
    },
    {
      'image': 'https://arcticgrey.com/cdn/shop/files/clutch.png?v=1703763545',
      'title': 'Top Web Developers 2020'
    },
    {
      'image':
          'https://arcticgrey.com/cdn/shop/files/goodfirms.png?v=1703763229',
      'title': 'Top Web Developers'
    },
    {
      'image':
          'https://arcticgrey.com/cdn/shop/files/shopify_expert.png?v=1703763560',
      'title': 'Enterprise Shopify Plus'
    },
    {
      'image': 'https://arcticgrey.com/cdn/shop/files/upcity.png?v=1703744411',
      'title': 'Best Development 2021'
    },
    {
      'image':
          'https://arcticgrey.com/cdn/shop/files/top-digital-new.png?v=1703763576',
      'title': 'Top Digital Agency'
    },
    {
      'image':
          'https://arcticgrey.com/cdn/shop/files/best-agencies.png?v=1703763589',
      'title': 'Best Shopify Agency'
    },
    {
      'image':
          'https://arcticgrey.com/cdn/shop/files/best-support.png?v=1703763605',
      'title': 'Best Support 2021'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++)
              if (i == 0)
                buildAwardContainer1(awards[i], 20)
              else if (i == 4)
                buildAwardContainer2(awards[i], 20)
              else
                buildAwardContainer(awards[i])
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 5; i < 9; i++)
              if (i == 5)
                buildAwardContainer3(awards[i], 20)
              else if (i == 8)
                buildAwardContainer4(awards[i], 20)
              else
                buildAwardContainer(awards[i]),
          ],
        ),
      ],
    );
  }

  Widget buildAwardContainer(Map<String, String> award) {
    return Container(
      width: 270,
      height: 180,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                award['image']!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     award['title']!,
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(
          //       fontSize: 14.0,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildAwardContainer1(Map<String, String> award, double radius) {
    return Container(
      width: 270,
      height: 180,
      decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey, width: 0.2)),
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              bottomLeft: Radius.circular(radius))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                award['image']!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     award['title']!,
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(
          //       fontSize: 14.0,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildAwardContainer2(Map<String, String> award, double radius) {
    return Container(
      width: 270,
      height: 180,
      decoration: BoxDecoration(
          border:
              const Border(left: BorderSide(color: Colors.grey, width: 0.2)),
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius),
              bottomRight: Radius.circular(radius))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                award['image']!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     award['title']!,
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(
          //       fontSize: 14.0,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildAwardContainer3(Map<String, String> award, double radius) {
    return Container(
      width: 270,
      height: 180,
      decoration: BoxDecoration(
          border: const Border(
              right: BorderSide(color: Colors.grey, width: 0.2),
              top: BorderSide(color: Colors.grey, width: 0.2)),
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                award['image']!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     award['title']!,
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(
          //       fontSize: 14.0,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildAwardContainer4(Map<String, String> award, double radius) {
    return Container(
      width: 260,
      height: 180,
      decoration: BoxDecoration(
          border: const Border(
              left: BorderSide(color: Colors.grey, width: 0.2),
              top: BorderSide(color: Colors.grey, width: 0.2)),
          color: Colors.white,
          borderRadius:
              BorderRadius.only(bottomRight: Radius.circular(radius))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                award['image']!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     award['title']!,
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(
          //       fontSize: 14.0,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 48, 96, 1),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Text(
                  'DROP US A MAIL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.network(
                  "assets/logos/arrow.png",
                  width: 150,
                  height: 170,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(240, 52),
                    backgroundColor: Color(0xFFFFC107), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    'Get In Touch',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.white),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'assets/logos/welogo.png', // Placeholder for logo
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 300,
                      child: const Text(
                        'They say an idiot with a plan can beat a genius without a plan. But what if we can do both? Team up with Arctic Grey & get paired with your new team that specializes in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company',
                      style: TextStyle(
                        color: Color(0xFFFFC107),
                        fontSize: 36, // Yellow color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Home',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Services',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Portfolio',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Contact',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'T & C\'s',
                      style: TextStyle(
                          color: Color(0xFFFFC107), // Yellow color
                          fontWeight: FontWeight.bold,
                          fontSize: 36),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Terms of Services',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Refund Policy',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white),
          const Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Copyright',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                Text(
                  'Mohali - Toronto - UAE',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
