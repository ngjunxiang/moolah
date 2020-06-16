dynamic enumFromString(String value, t) {
    var enum_value = '$t.$value';
    return t.values.firstWhere((e)=> e.toString() == enum_value, orElse: () => null);
}