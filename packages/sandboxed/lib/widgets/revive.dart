// TODO(@melvspace): 03/22/25 revive another types
dynamic revive(dynamic object) {
  switch (object) {
    case Map map:
      return {
        for (final entry in map.entries) //
          entry.key: revive(entry.value),
      };

    case List list:
      return [
        for (final item in list) //
          revive(item),
      ];

    case "true":
    case "false":
      return object == "true";

    case String integer when RegExp(r'^\d+$').hasMatch(integer):
      return int.parse(integer);

    case String number when RegExp(r'^\d+\.\d+$').hasMatch(number):
      return double.tryParse(number);

    default:
      return object;
  }
}
