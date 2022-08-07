import 'package:flutter/material.dart';
import 'package:portfolio/providers/player_fullscreen_selection_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

class FullscreenVideoPlayer extends StatefulWidget {
  final String? videoUrl;
  final Duration duration;

  const FullscreenVideoPlayer(
      {Key? key, required this.videoUrl, required this.duration})
      : super(key: key);

  @override
  State<FullscreenVideoPlayer> createState() => _FullscreenVideoPlayerState();
}

class _FullscreenVideoPlayerState extends State<FullscreenVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl ?? "")
      ..addListener(() => setState(() {}))
      ..initialize().then((value) {
        _controller.seekTo(widget.duration);
        _controller.pause();
      });
  }

  _exitFullscreenPlayer() async {
    Duration? duration = await _controller.position;
    Provider.of<PlayerFullscreenSelectionProvider>(context, listen: false)
        .changeSelection(false, "", duration);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _controller.value.isInitialized
        ? Container(
            width: size.width,
            height: size.height,
            color: Colors.black.withOpacity(0.7),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  onTap: () => _exitFullscreenPlayer(),
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
        : Container(
            width: size.width,
            height: size.height,
            color: Colors.black.withOpacity(0.7),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
