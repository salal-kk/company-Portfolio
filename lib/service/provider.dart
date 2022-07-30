import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../controller/datafetchprovider.dart';

final List<SingleChildWidget> providers=[
  ChangeNotifierProvider(create: (_)=>DataFetchProvider())
];