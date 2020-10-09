# KeyboardContoller

`KeyboardController` is a utility class that allows to easily handle keyboard showing/hiding inside `UIViewController`'s view. It provides 2 default content behavior types and ability to set custom content behavior with a closure.  
For hard customization, `KeyboardController` provides a set of callbacks that correspond to keyboard events from `UIKit`, i.e. `UIResponder.keyboardWillShowNotification`, etc.

All information from keyboard event notifications is wrapped into `KeyboardInfo` struct which maps `Notification.userInfo` dictionary into properties.

## Example

To run the example project, open and run `KeyboardController.xcodeproj` in XCode.

## License

KeyboardController is available under the MIT license. See the LICENSE file for more info.
