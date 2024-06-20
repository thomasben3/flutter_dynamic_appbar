part of '../dynamic_appbar.dart';

/*
  Model for the DynamicAppBarView.
  It will handle the visibility of the appbar.
*/
class _DynamicAppBarModel extends ChangeNotifier {
  /// Visibility variable of the appbar
  bool _isVisible;

  /// Constructor, if isVisibleByDefault is not provided, it will be true by default
  _DynamicAppBarModel({bool? isVisibleByDefault})
      : _isVisible = isVisibleByDefault ?? true;

  /// Getter for the visibility of the appbar
  bool get isVisible => _isVisible;

  /// Toggle the visibility of the appbar
  void toggleIsVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  /// Method that will be called when the user is scrolling to manage the visibility of the appbar
  bool onScrollNotification(
      BuildContext context, ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final metrics = notification.metrics;
      final scrollDelta = notification.scrollDelta ?? 0;
      /// CHECKS IN THIS IF :
      if (scrollDelta.abs() > 10 /// user has scroll more than 10 pixel
              &&
              (metrics.pixels > metrics.minScrollExtent &&
                  metrics.pixels <
                      metrics
                          .maxScrollExtent) /// AND (scrollView is not < min OR > max) (this prevent from 'bounceEffect' unwanted notifications)
              &&
              ((isVisible && scrollDelta > 0) ||
                  (!isVisible &&
                      scrollDelta <
                          0)) /// AND user is scrolling in a way that need to trigers .invert()
          ) {
        toggleIsVisible();
      }
    }

    /// return false to allow the notification to continue to be dispatched to further ancestors
    return false;
  }
}
