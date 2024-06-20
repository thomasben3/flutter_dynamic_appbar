part of '../dynamic_appbar.dart';

/*
  Widget used to wrap a View with a dynamic appbar.
  The appBar will desapear when the user is scrolling down, and appears when scrolling up.
*/
class DynamicAppBarView extends StatelessWidget {
  const DynamicAppBarView({
    super.key,
    this.title,
    this.leftButton,
    this.rightButton,
    this.appBarHeight = 50,
    this.appBarColor = Colors.white,
    required this.child
  });

  final Widget?                   title;
  final Widget?                   leftButton;
  final Widget?                   rightButton;
  final double                    appBarHeight;
  final Color?                    appBarColor;
  final Widget                    child;


  @override
  Widget build(BuildContext context) {

    // The Container, SafeArea and Material widgets are to prevent Ink widgets from being visible above the DynamicAppBarView
    return Container(
      color: appBarColor,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Material(
          child: _DynamicAppBarProvider(
            model: _DynamicAppBarModel(),
            child: Builder(
              builder: (context) {
                final _DynamicAppBarModel model = _DynamicAppBarProvider.of(context);

                return Stack(
                  children: [
                    Positioned.fill(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) => model.onScrollNotification(context, notification),
                        child: child
                      )
                    ),
                    _DynamicAppBar(
                      title: title,
                      leftButton: leftButton,
                      rightButton: rightButton,
                      appBarColor: appBarColor,
                      appBarHeight: appBarHeight
                    )
                  ],
                );
              }
            ),
          )
        ),
      ),
    );
  }
}
