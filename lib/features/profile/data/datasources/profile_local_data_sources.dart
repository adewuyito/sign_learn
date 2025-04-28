import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileLocalSourceProvider = Provider<IProfileLocalSource>((ref) {
  return ProfileLocalSource(ref);
});

abstract class IProfileLocalSource{
}

class ProfileLocalSource implements IProfileLocalSource {
  Ref ref;
  ProfileLocalSource(this.ref);
}