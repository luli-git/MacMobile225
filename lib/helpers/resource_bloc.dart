import 'dart:async';

import 'package:mac_mobile_attempt/helpers/resource_view_model.dart';
import 'package:mac_mobile_attempt/helpers/resource.dart';

class ResourceBloc {
  final ResourceViewModel resourceViewModel = ResourceViewModel();
  final resourceController = StreamController<List<Resource>>();
  Stream<List<Resource>> get resourceItems => resourceController.stream;

  resourceBloc() {
    resourceController.add(resourceViewModel.getResources());
  }
}
