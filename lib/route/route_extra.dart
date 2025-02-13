import 'package:interactive_diary/features/media_diary/_shared/constant/media_type.dart';
import 'package:nartus_storage/nartus_storage.dart';

class WriteDiaryExtra {
  final LatLng latLng;
  final String? address;
  final String? business;

  WriteDiaryExtra(this.latLng, this.address, this.business);
}

class PreviewMediaExtra {
  final String path;
  final MediaType type;

  PreviewMediaExtra(this.path, this.type);
}
