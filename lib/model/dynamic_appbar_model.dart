part of '../dynamic_appbar.dart';

class _DynamicAppBarModel extends ChangeNotifier {
  bool _isVisible;
  
  _DynamicAppBarModel({bool? isVisibleByDefault}) : _isVisible = isVisibleByDefault ?? true;

  bool get isVisible => _isVisible;

  void toggleIsVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  bool onScrollNotification(BuildContext context, ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final metrics = notification.metrics;
      final scrollDelta = notification.scrollDelta ?? 0;
                                                                                                    // CHECKS IN THIS IF :
      if (scrollDelta.abs() > 10                                                                    // user has scroll more than 10 pixel
        && (metrics.pixels > metrics.minScrollExtent && metrics.pixels < metrics .maxScrollExtent)  // AND (scrollView is not < min OR > max) (this prevent from 'bounceEffect' unwanted notifications)
        && ((isVisible && scrollDelta > 0) || (!isVisible && scrollDelta < 0))                      // AND user is scrolling in a way that need to trigers .invert()
      ) {
        toggleIsVisible();
      }
    }

    return false;
  }
}