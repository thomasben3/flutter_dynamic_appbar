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
    required this.appBarColor
  });

  final Widget? title;
  final Widget? leftButton;
  final Widget? rightButton;
  final double  appBarHeight;
  final Color?  appBarColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: _DynamicAppBarProvider.of(context).isVisible ? 0 : -appBarHeight,
      left: 0,
      right: 0,
      height: appBarHeight,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
      child: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).padding.left,
          right: MediaQuery.of(context).padding.right
        ),
        color: appBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50,
              child: leftButton
            ),
            if (title != null)
              title!,
            SizedBox(
              width: 50,
              child: rightButton
            )
          ],
        ),
      ),
    );
  }
}