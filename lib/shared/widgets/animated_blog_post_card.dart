import 'package:flutter/material.dart';
import 'package:models/models.dart';

class AnimatedBlogPostCard extends StatelessWidget {
  const AnimatedBlogPostCard({
    super.key,
    required this.blogPost,
    required this.cardIndex,
    required this.animation,
  });
  final BlogPost blogPost;
  final int cardIndex;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final colors = [
      colorScheme.primary,
      colorScheme.secondary,
      colorScheme.primaryContainer,
      colorScheme.secondaryContainer,
    ];

    final fontColors = [
      colorScheme.onPrimary,
      colorScheme.onSecondary,
      colorScheme.onPrimaryContainer,
      colorScheme.onSecondaryContainer,
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: colors[cardIndex % colors.length],
          child: Text(
            blogPost.authorInitials,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      blogPost.authorImageUrl,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: blogPost.author,
                        style: textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: ' created a new post',
                            style: textTheme.bodyLarge,
                          ),
                          TextSpan(text: ' ${blogPost.publishedDateFormatted}')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateX(animation.value),
                    alignment: Alignment.topCenter,
                    child: child,
                  );
                },
                child: Container(
                  height: 115,
                  margin: const EdgeInsets.only(top: 8.0),
                  color: colors[cardIndex % colors.length],
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          blogPost.thumbnailUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                blogPost.title,
                                maxLines: 2,
                                style: textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: fontColors[cardIndex % colors.length],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.remove_red_eye,
                                    size: 20,
                                    color:
                                        fontColors[cardIndex % colors.length],
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    blogPost.viewsCount.toString(),
                                    style: textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          fontColors[cardIndex % colors.length],
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Icon(
                                    Icons.favorite,
                                    size: 20,
                                    color:
                                        fontColors[cardIndex % colors.length],
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    blogPost.likesCount.toString(),
                                    style: textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          fontColors[cardIndex % colors.length],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
