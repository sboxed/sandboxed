import 'package:build/build.dart';
import 'package:vibook_generator/aggregator.dart';
import 'package:vibook_generator/gatherer.dart';

Builder builder(BuilderOptions options) {
  return ComponentAggregateBuilder();
}

Builder gatherer(BuilderOptions options) {
  return GathererBuilder();
}
