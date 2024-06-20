# Dynamic AppBar for Flutter

The Dynamic AppBar for Flutter enhances user experience by dynamically hiding the app bar when scrolling down and reappearing when scrolling up. It offers customizable features such as dynamic title, left and right buttons, and adjustable height and color options, making it a versatile solution for navigation in Flutter applications.

![](https://github.com/thomasben3/flutter_dynamic_appbar/blob/main/demo.gif)

## Features

- Automatically hides the app bar when scrolling down
- Reappears the app bar when scrolling up
- Customizable title, left and right buttons
- Adjustable app bar height and color

## Getting started

To use this package, add `dynamic_appbar` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  dynamic_appbar: ^1.0.0
```

## Usage

Here's a basic example of how to use the DynamicAppBarView:

```dart
import 'package:flutter/material.dart';
import 'package:dynamic_appbar/dynamic_appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DynamicAppBarView(
          title: Text('My App'),
          leftButton: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
            },
          ),
          rightButton: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings button press
            },
          ),
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please [open an issue](https://github.com/thomasben3/flutter_dynamic_appbar/issues) on the GitHub repository. Pull requests are also welcome.

## License

This project is licensed under the 3-Clause BSD License. See the [LICENSE](https://github.com/thomasben3/flutter_dynamic_appbar/blob/main/LICENSE) file for more information.