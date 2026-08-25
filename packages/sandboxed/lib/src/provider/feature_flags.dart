import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/feature_flags.dart';

Set<FeatureFlags> featureFlags(Ref ref) {
  return {};
}

final featureFlagsProvider = Provider<Set<FeatureFlags>>(featureFlags);
