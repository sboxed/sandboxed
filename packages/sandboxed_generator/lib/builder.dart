import 'package:build/build.dart';
import 'package:sandboxed_generator/aggregator.dart';
import 'package:sandboxed_generator/config/aggregator_config.dart';
import 'package:sandboxed_generator/gatherer.dart';

Builder builder(BuilderOptions options) {
  return ComponentAggregateBuilder(AggregatorConfig.fromMap(options.config));
}

Builder gatherer(BuilderOptions options) {
  return GathererBuilder();
}
