import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

import '../../providers/player_fullscreen_selection_provider.dart';

class ProjectVideo extends StatefulWidget {
  final String? videoUrl;

  const ProjectVideo({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<ProjectVideo> createState() => _ProjectVideoState();
}

class _ProjectVideoState extends State<ProjectVideo> {
  late VideoPlayerController _controller;
  late PlayerFullscreenSelectionProvider _provider;

  @override
  void initState() {
    super.initState();
    //provider listener function init
    _provider = context.read<PlayerFullscreenSelectionProvider>();
    _provider.addListener(_changePlayerPosition);

    //player init
    _controller = VideoPlayerController.network(widget.videoUrl ?? "")
      ..addListener(() => setState(() {}))
      ..initialize().then((value) {
        _controller.pause();
      });
  }

  //change small player position to match fullscreen player position
  _changePlayerPosition() {
    if (_provider.videoUrl == "") {
      _controller.seekTo(_provider.duration);
    }
  }

  _openFullscreenPlayer() async {
    _controller.pause();
    Duration? duration = await _controller.position;
    Provider.of<PlayerFullscreenSelectionProvider>(context, listen: false)
        .changeSelection(
      true,
      widget.videoUrl,
      duration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: LayoutBuilder(builder: (context, constraints) {
        return _controller.value.isInitialized
            ? SizedBox(
                width: constraints.maxWidth / 2,
                height: constraints.maxWidth / 2,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    _controller.value.isPlaying
                        ? const SizedBox()
                        : Container(
                            alignment: Alignment.center,
                            color: Colors.black26,
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.green,
                              size: 80,
                            ),
                          ),
                    Positioned.fill(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play(),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: InkWell(
                                        mouseCursor: SystemMouseCursors.click,
                                        child: VideoProgressIndicator(
                                          _controller,
                                          allowScrubbing: true,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      child: const Icon(
                                        Icons.fullscreen,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                      onTap: () => _openFullscreenPlayer(),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
              );
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _provider.removeListener(_changePlayerPosition);
  }
}
