# Isolate (An isolated Dart execution context.)

Project that aims to understan how it work in Flutter with each platform.

Basically the ISOLATES help to handle the multithreading in Flutter.

But we need to use just when it's necessary. For instance, when we want to process big chunks of data.
Like an app downloader or something heavy in the device.

**Reference to this video to know how it exactly works:**

https://www.youtube.com/watch?v=vl_AaCgudcY

But basically how an isolate works?

When create an isolate, gets its own memory space, event loop and the resources are private. That
means that the isolate can't access the resources of the main isolate or viceversa.

# Example from Flutter (Background Worker)

Implement a Isolate that will download some info and then process it.
https://docs.flutter.dev/cookbook/networking/background-parsing

# Too important to read

https://dart.dev/guides/language/concurrency#background-workers

# References (Related info)

More references about the isolation:

https://www.youtube.com/watch?v=TF8LwonwKhg

https://www.youtube.com/watch?v=5AxWC49ZMzs

Isolate: https://medium.com/flutter-community/thread-and-isolate-with-flutter-30b9631137f3

Concurrency: https://dart.dev/guides/language/concurrency

# Summary

Whe can create an isolate in Flutter with the following code:

**Isolate.spawn(function, senderPort);**

This basically allow to handle the isolate by our own.

**compute(function,params);**

Basically creates the isolates and run the function and return the expected result.

Close the isolate by its own.

Depending on the case we can use one or the other.
