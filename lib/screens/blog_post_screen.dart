import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:journal_and_blog_app/services/ai_speech_client.dart';
import 'package:models/models.dart';
import 'package:path_provider/path_provider.dart';

class BlogPostScreen extends StatefulWidget {
  const BlogPostScreen({
    super.key,
    required this.blogPostId,
  });

  final String blogPostId;

  @override
  State<BlogPostScreen> createState() => _BlogPostScreenState();
}

class _BlogPostScreenState extends State<BlogPostScreen> {
  late BlogPost blogPost;

  @override
  void initState() {
    blogPost = BlogPost.blogPosts.firstWhere((blogPost) {
      return blogPost.id == widget.blogPostId;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blogPost.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: blogPost.paragraphs
            .map(
              (paragraph) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: SelectableTextWithCustomMenu(text: paragraph),
              ),
            )
            .toList(),
      ),
    );
  }
}

class SelectableTextWithCustomMenu extends StatefulWidget {
  const SelectableTextWithCustomMenu({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<SelectableTextWithCustomMenu> createState() =>
      _SelectableTextWithCustomMenuState();
}

class _SelectableTextWithCustomMenuState
    extends State<SelectableTextWithCustomMenu> {
  final AudioPlayer player = AudioPlayer();
  var selectedText = '';
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      widget.text,
      onSelectionChanged: (selection, cause) {
        setState(() {
          selectedText = selection.textInside(widget.text);
        });
      },
      contextMenuBuilder: (context, editableTextState) {
        return AdaptiveTextSelectionToolbar(
          anchors: editableTextState.contextMenuAnchors,
          children: [
            FilledButton(
              onPressed: () async {
                print(selectedText);
                final client = AiSpeechClient();
                final response = await client.convertTextToSpeech(
                  text: selectedText,
                );
                print(response);
                playFromUint8List(response['audioBytes']);
              },
              child: Text('Convert Text to Speech'),
            ),
          ],
        );
      },
    );
  }

  void playFromUint8List(Uint8List uint8list) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File tempFile = File('$tempPath/audio_from_tts.mp3');
    await tempFile.writeAsBytes(uint8list);
    player.play(DeviceFileSource(tempFile.path));
  }
}
