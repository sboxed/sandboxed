import 'package:build/build.dart';
import 'package:vibook_generator/aggregator.dart';
import 'package:vibook_generator/config/aggregator_config.dart';
import 'package:vibook_generator/gatherer.dart';

Builder builder(BuilderOptions options) {
  return ComponentAggregateBuilder(AggregatorConfig.fromMap(options.config));
}

Builder gatherer(BuilderOptions options) {
  return GathererBuilder();
}
