import 'package:flutter/material.dart';
import '../shared/widgets/animated_blog_post_card.dart';
import 'package:models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late List<BlogPost> blogPosts;
  late PageController pageController;
  final Map<int, AnimationController> animationControllers = {};
  var middleCardIndex = -1;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.25);
    pageController.addListener(_calculateMiddleCard);

    blogPosts = [
      ...BlogPost.blogPosts,
      ...BlogPost.blogPosts,
      ...BlogPost.blogPosts,
    ];
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeAnimation();
    });
  }

  void _initializeAnimation() {
    int initialMiddleCard = (pageController.page?.floor() ?? 0) + 2;

    for (int i = 0; i <= initialMiddleCard; i++) {
      if (i < initialMiddleCard) {
        animationControllers[i]?.forward();
      }
    }

    setState(() {
      middleCardIndex = initialMiddleCard;
    });
  }

  void _calculateMiddleCard() {
    int newMiddleCard = (pageController.page?.round() ?? 0) + 2;

    if (newMiddleCard > middleCardIndex) {
      animationControllers[newMiddleCard - 1]?.forward();
      setState(() {
        middleCardIndex = newMiddleCard;
      });
    }

    if (newMiddleCard < middleCardIndex) {
      animationControllers[newMiddleCard]?.reverse();
      setState(() {
        middleCardIndex = newMiddleCard;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('atomsbox')),
      body: Stack(
        children: [
          const VerticalDivider(width: 64.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.vertical,
              padEnds: false,
              itemCount: blogPosts.length,
              itemBuilder: (context, index) {
                animationControllers.putIfAbsent(
                  index,
                  () => AnimationController(
                    vsync: this,
                    duration: const Duration(milliseconds: 800),
                  ),
                );

                var animation = Tween<double>(begin: 0.0, end: 0.4).animate(
                  CurvedAnimation(
                    parent: animationControllers[index]!,
                    curve: Curves.bounceOut,
                  ),
                );

                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/blog-post',
                      arguments: blogPosts[index].id,
                    );
                  },
                  child: AnimatedBlogPostCard(
                    blogPost: blogPosts[index],
                    cardIndex: index,
                    animation: animation,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationControllers.forEach((key, controller) => controller.dispose());
    pageController.removeListener(_calculateMiddleCard);
    pageController.dispose();
    super.dispose();
  }
}
