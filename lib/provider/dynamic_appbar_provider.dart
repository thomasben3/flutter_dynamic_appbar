part of '../dynamic_appbar.dart';

class _DynamicAppBarProvider extends InheritedNotifier<_DynamicAppBarModel> {
  final _DynamicAppBarModel model;

  const _DynamicAppBarProvider({required this.model, required super.child})
      : super(notifier: model);

  static _DynamicAppBarModel of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_DynamicAppBarProvider>()!.model;
  }
}