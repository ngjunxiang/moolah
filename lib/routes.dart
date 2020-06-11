import 'package:flutter/widgets.dart';

import './screens/overview/overview_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    "/": (BuildContext context) => OverviewScreen(),
};