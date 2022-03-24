import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class PlayButton extends StatefulWidget {
  final String link;
  const PlayButton({Key? key, required this.link}) : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {

  bool _isPlayed = false;

  AssetsAudioPlayer pronunciation = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    loadAudio();
  }

  loadAudio() async {
    await pronunciation.open(
      Audio.network(widget.link),
      autoStart: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    late bool _hasAudio;
    if (widget.link != "") {
      _hasAudio = true;
    } else {
      _hasAudio = false;
    }
    return Visibility(
      visible: _hasAudio,
      child: IconButton(
        icon: Icon(
          _isPlayed ? Icons.stop : Icons.play_arrow
        ),
        onPressed: () async {
          log(widget.link);
          _isPlayed ? pronunciation.play() : pronunciation.stop();
          setState(() {
            _isPlayed = !_isPlayed;
          });
        },
      ),
    );
  }
}
