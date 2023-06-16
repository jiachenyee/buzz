# 🐝 Buzz
## Easily add a new dimension to your app

## CoreHaptics + @resultBuilder
Use SwiftUI-like syntax to create haptic feedback patterns.
```swift
struct CircleHaptics: HapticSequence {
    var haptics: HapticEvents {
        for i in 0..<11 {
            let intensity = (Float(i) / 11) * 0.8 + 0.1
            Continuous(duration: 0.1,
                       intensity: intensity,
                       sharpness: Float(i) / 11)
        }
        
        for i in 0..<4 {
            let intensity = 1 - (Float(i) / 4) * 0.8 + 0.1
            Continuous(duration: 0.1,
                       intensity: intensity,
                       sharpness: 1 - (Float(i) / 4))
        }
        
        Transient(intensity: 1, sharpness: 1)
        
        Wait(duration: 0.2)
        
        Transient(intensity: 1, sharpness: 0.5)
    }
}
```

## Usage
1. Add the Swift Package: [https://github.com/jiachenyee/buzz](https://github.com/jiachenyee/buzz)
2. Create a new file to store your haptics.
3. Type/Paste in the boilerplate
```swift
struct MyHaptics: HapticSequence {
    var haptics: HapticEvents {
        Continuous(duration: 1,
                   intensity: 0.5,
                   sharpness: 0.5)
    }
}
```
4. Play it by using `MyHaptics.play()`.
```swift
Button("Play") {
    MyHaptics.play()
}
```

## Demo Project
I've built a demo project that has a circle animation demo along with a heartbeat one. 
Download it and play around [here](Buzz-Demo).

## Code Snippet
Lazy to type in all that boilerplate? Use the `.codesnippet`.
1. Quit Xcode and open Finder
2. Press Command-Shift-G and paste in "~/Library/Developer/Xcode/UserData/CodeSnippets"
3. Drag the [Buzz.codesnippet](Buzz.codesnippet) file into it.
4. Relaunch Xcode
5. Now you can access it by typing `Buzz` in Xcode, or by pressing Command-Shift-L to open your Library.

## License
[MIT](License).
