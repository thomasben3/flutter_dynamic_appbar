part of '../dynamic_appbar.dart';

/*
  Widget used to wrap a View with a dynamic appbar.
  The appBar will desapear when the user is scrolling down, and appears when scrolling up.
*/
class DynamicAppBarView extends StatelessWidget {
  const DynamicAppBarView(
      {super.key,
      this.title,
      this.leftButton,
      this.rightButton,
      this.appBarHeight = 50,
      this.appBarColor = Colors.white,
      required this.child});

  /// Title of the appbar, this will be the center widget of the appbar
  final Widget? title;

  /// Left button of the appbar, this will be the left widget of the appbar
  final Widget? leftButton;

  /// Right button of the appbar, this will be the right widget of the appbar
  final Widget? rightButton;

  /// Height of the appbar
  final double appBarHeight;

  /// Background color of the appbar
  final Color? appBarColor;

  /// Child widget, this will be the view that will be wrapped by the appbar
  final Widget child;

  @override
  Widget build(BuildContext context) {
    /// The Container, SafeArea and Material widgets are to prevent Ink widgets from being visible above the DynamicAppBarView
    return Container(
      color: appBarColor,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Material(
            child: _DynamicAppBarProvider(
          model: _DynamicAppBarModel(),
          child: Builder(builder: (context) {
            /// Access the _DynamicAppBarModel by the _DynamicAppBarProvider
            final _DynamicAppBarModel model =
                _DynamicAppBarProvider.of(context);

            /// Return the Stack with the child and the _DynamicAppBar
            return Stack(
              children: [
                /// This Positioned.fill is the parent of the child widget
                Positioned.fill(
                    child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) =>
                            model.onScrollNotification(context, notification),
                        child: child)),
                /// This is the appbar widget
                _DynamicAppBar(
                    title: title,
                    leftButton: leftButton,
                    rightButton: rightButton,
                    appBarColor: appBarColor,
                    appBarHeight: appBarHeight)
              ],
            );
          }),
        )),
      ),
    );
  }
}
