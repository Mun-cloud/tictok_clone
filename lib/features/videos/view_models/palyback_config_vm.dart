import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/features/videos/models/playback_config_model.dart';
import 'package:tictok_clone/features/videos/repos/video_playback_config_repo.dart';

class PlaybackConfigViewModel extends Notifier<PlaybackConfigModal> {
  final VideoPlaybackConfigRepository _repository;

  PlaybackConfigViewModel(this._repository);

  void setMuted(bool value) {
    _repository.setMuted(value);
    state = PlaybackConfigModal(
      muted: value,
      autoplay: state.autoplay,
    );
  }

  void setAutopaly(bool value) {
    _repository.setAutoplay(value);
    state = PlaybackConfigModal(
      muted: state.muted,
      autoplay: value,
    );
  }

  @override
  PlaybackConfigModal build() {
    return PlaybackConfigModal(
      muted: _repository.isMuted(),
      autoplay: _repository.isAutoplay(),
    );
  }
}

// NotifierProvider<불러올 클래스, 반환할 클래스>
final playbackConfigProvider =
    NotifierProvider<PlaybackConfigViewModel, PlaybackConfigModal>(
        () => throw UnimplementedError());
