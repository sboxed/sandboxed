import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sandboxed/feature_flags.dart';

part 'feature_flags.g.dart';

@Riverpod(keepAlive: true)
Set<FeatureFlags> featureFlags(Ref ref) {
  return {};
}
