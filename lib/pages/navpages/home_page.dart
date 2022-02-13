// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:travel/misc/colors.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    
    TabController _tabController = TabController(length: 3, vsync: this);

    var images = {
      'kayaking.png': 'Kayaking',
      'balloning.png': 'Balloning',
      'snorkling.png': 'Snorkling',
      'hiking.png': 'Hiking'
    };

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 70,
              left: 20,
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                  ),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            child: const AppLargeText(
              text: 'Discover'
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicator: CircleTabIndicator(
                  color: AppColors.mainColor,
                  radius: 4,
                ),
                tabs: const  [
                  Tab(text: 'Places'),
                  Tab(text: 'Inspiration'),
                  Tab(text: 'Emotions'),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) { 
                    return 
                      Container(
                        margin: const EdgeInsets.only(
                          right: 15,
                        ),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/mountain.jpeg',  
                            ),
                            fit: BoxFit.cover
                          ),
                        ),
                      );
                  },
                ),
                Text('Shiu'),
                Text('Cr'),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppLargeText(
                  text: 'Explore more',
                  size: 22,
                ),
                AppText(
                  text: 'See all',
                  color: Colors.grey,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            height: 120,
            width: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) { 
                return 
                  Container(
                    margin: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/' + images.keys.elementAt(index),  
                              ),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: AppText(
                            text: images.values.elementAt(index),
                            color: AppColors.textColor2,  
                          ),
                        )
                      ],
                    ),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {

  final Color color;
  final double radius;

  CircleTabIndicator({ required this.color, required this.radius });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {

    return _circlePainter(color: color, radius: radius);
  
  }
  
}

class _circlePainter extends BoxPainter {

  final Color color;
  final double radius;

  _circlePainter({ required this.color, required this.radius });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {

    Paint _paint = Paint();

    _paint.color = color;
    _paint.isAntiAlias = true;

    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height - radius/2);

    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}