import 'package:flutter/material.dart';

// In Flutter, all UI components are widgets.
// A widget is an instance of a widget class, which describes part of a user interface.

void main() {
  // The runApp function takes a widget and makes it the root of the widget tree.
  runApp(GalleryApp());
}

// In React, a component is re-rendered whenever its state changes.
// Whether a component re-renders depends on changes to its properties and state.
// In Flutter, a widget can either be stateful or stateless.
// A stateful widget rebuilds whenever its state changes,
// whereas a stateless widget is built once and does not update unless its parent rebuilds.

class GalleryApp extends StatelessWidget {
  /* The build method is called whenever the widget needs to be rendered.
     This method is called frequently, so avoid heavy computations here. */
  /* The 'context' parameter provides information about the location of this widget in the widget tree,
     it allows you to interact with the widget's ancestors and descendants within the tree.
     Widgets can use the BuildContext to retrieve theme information, such as colors, text styles, and other visual properties defined in the ThemeData class. */
  @override
  Widget build(BuildContext context) {
    // MaterialApp provides basic styling for apps, such as themes and navigation.
    return MaterialApp(
      /* Properties and nested widgets can be passed to widgets via named parameters.
         This is similar to passing props to components in React. */
      title: 'PhotoArc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

// HomeScreen is a stateful widget as it manages dynamic state changes.
class HomeScreen extends StatefulWidget {
  // createState method is called during the initial creation of the widget tree when Flutter is setting up the widget for the first time.
  @override
  _HomeScreenState createState() => _HomeScreenState();
/* Once the State object is created, the framework calls its initState method (if overridden) for initialization,
     followed by the build method to construct the widget tree for this part of the UI. */
}

// _HomeScreenState is the state associated with the HomeScreen widget.
// It manages the state for HomeScreen and contains logic for UI updates.
class _HomeScreenState extends State<HomeScreen> {
  // State variables that determine the number of images viewed and liked by the user.
  int viewedPhotos = 0;
  int likedPhotos = 0;

  _HomeScreenState() {
    print("HomeScreen state created. This message should appear once since it is the build that runs whenever state is set.");
  }

  @override
  Widget build(BuildContext context) {
    // This build method is called whenever the state changes using setState.
    // It builds the UI based on the current state.
    print("build method called");

    return Scaffold(
      appBar: AppBar(
        title: Text('PhotoArc Gallery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Photos Viewed: $viewedPhotos"),
            Text("Photos Liked: $likedPhotos"),
            // A button to simulate viewing a photo. It updates the state using setState.
            // notice how the value is updated in UI, and "build method called" is printed in console too
            ElevatedButton(
              onPressed: () => setState(() {
                viewedPhotos++;
              }),
              child: const Text("View Photo"),
            ),
            // A button to simulate liking a photo. Notice how UI is not updated
            ElevatedButton(
              onPressed: () => likedPhotos++,
              child: const Text("Like Photo"),
            ),
            // A button to refresh the state without changing any variables.
            // Demonstrates how setState triggers a rebuild.
            ElevatedButton(
              onPressed: () => setState(()=>{}),
              child: const Text("Refresh State"),
            ),
          ],
        ),
      ),
    );
  }
}