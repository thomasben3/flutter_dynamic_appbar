part of '../dynamic_appbar.dart';

/*
  AppBar of DynamicAppBarView.
  Will show an "open drawer" button if scaffoldKey is provided, and a BackButton if hasBackButton = true
*/
class _DynamicAppBar extends StatelessWidget {
  const _DynamicAppBar({
    required this.title,
    required this.leftButton,
    required this.rightButton,
    required this.appBarHeight,
    required this.appBarColor,
  });

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

  @override
  Widget build(BuildContext context) {
    /// Return the AnimatedPositioned widget that will animate the appbar when it appears or disappears
    return AnimatedPositioned(
      /// The value of top will be 0 if the appbar is visible, and -appBarHeight if it is not, this will make the appbar to appear or disappear
      top: _DynamicAppBarProvider.of(context).isVisible ? 0 : -appBarHeight,
      left: 0,
      right: 0,
      height: appBarHeight,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
      child: Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).padding.left,
            right: MediaQuery.of(context).padding.right),
        color: appBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 50, child: leftButton),
            if (title != null) title!,
            SizedBox(width: 50, child: rightButton)
          ],
        ),
      ),
    );
  }
}
