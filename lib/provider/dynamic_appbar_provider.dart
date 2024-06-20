part of '../dynamic_appbar.dart';

/*
  Provider for the DynamicAppBarView.
  It will handle the access of the _DynamicAppBarModel in the widget tree.
*/
class _DynamicAppBarProvider extends InheritedNotifier<_DynamicAppBarModel> {
  final _DynamicAppBarModel model;

  // Constructor
  const _DynamicAppBarProvider({required this.model, required super.child})
      : super(notifier: model);

  // This method is used to access the closest _DynamicAppBarModel of the closest parent _DynamicAppBarProvider
  static _DynamicAppBarModel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_DynamicAppBarProvider>()!
        .model;
  }
}
