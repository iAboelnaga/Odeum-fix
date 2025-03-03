# Odeum

Odeum is a simple iOS Video player library with basic control

![build](https://github.com/hainayanda/Odeum/workflows/build/badge.svg)
![test](https://github.com/hainayanda/Odeum/workflows/test/badge.svg)
[![SwiftPM Compatible](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen)](https://swift.org/package-manager/)
[![Version](https://img.shields.io/cocoapods/v/Odeum.svg?style=flat)](https://cocoapods.org/pods/Odeum)
[![License](https://img.shields.io/cocoapods/l/Odeum.svg?style=flat)](https://cocoapods.org/pods/Odeum)
[![Platform](https://img.shields.io/cocoapods/p/Odeum.svg?style=flat)](https://cocoapods.org/pods/Odeum)

<p align="center">
<img src="ScreenShot.png"/>
<p align="center">
  
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- Swift 5.0 or higher
- iOS 10.0 or higher

## Installation

### Cocoapods

Odeum is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Odeum'
```

### Swift Package Manager from XCode

- Add it using XCode menu **File > Swift Package > Add Package Dependency**
- Add **<https://github.com/hainayanda/Odeum.git>** as Swift Package URL
- Set rules at **version**, with **Up to Next Major** option and put **1.2.6** as its version
- Click next and wait

### Swift Package Manager from Package.swift

Add as your target dependency in **Package.swift**

```swift
dependencies: [
    .package(url: "https://github.com/hainayanda/Odeum.git", .upToNextMajor(from: "1.2.6"))
]
```

Use it in your target as `Odeum`

```swift
 .target(
    name: "MyModule",
    dependencies: ["Odeum"]
)
```

## Author

Nayanda Haberty, hainayanda@outlook.com

## License

Odeum is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

## Usage

Using Odeum is very easy. You could see the sample project or just read this documentation.

Since odeum player is subclass of `UIView`. adding player is same like adding simple `UIView`:

```swift
var odeumPlayer = OdeumPlayerView()
view.addSubview(odeumPlayer)
```

Is up to you how you want it to be framed, using `NSLayoutConstraints` or by manually framing it.

You could also add it using storyboard or XIB. Just use `UIView` and set its `CustomClass` to be `OdeumPlayerView`.

<p align="center">
<img src="CustomView.png"/>
<p align="center">

To play the player, just add URL:

```swift
odeumPlayer.play(url: myURL)
```

there are methods to manipulate video playing in odeum:

- `func set(url: URL)` to set url but not automatically play the video
- `func play()` to play the video if video is ready to play
- `func play(url: URL)` to set url and automatically play it if video is ready
- `func pause()` to pause the video
- `func set(mute: Bool)` to mute or unmute the video
- `func forward(by second: TimeInterval) -> Bool` to forward a video by given `TimeInterval`
- `func replay(by second: TimeInterval) -> Bool` to rewind a video by given `TimeInterval`
- `func goFullScreen()` to go to full screen
- `func dismissFullScreen()` to dismiss full screen
- `func removeVideo()` to stop and remove video from video player

All those functions will run automatically on the player control hover buttons

### Delegate

You could observe event in the OdeumPlayerView by give them delegate:

```swift
public protocol OdeumPlayerViewDelegate: class {
    func odeumDidPlayVideo(_ player: OdeumPlayerView)
    func odeumDidPauseVideo(_ player: OdeumPlayerView)
    func odeumViewControllerToPresentFullScreen(_ player: OdeumPlayerView) -> UIViewController
    func odeumDidGoToFullScreen(_ player: OdeumPlayerView)
    func odeumDidDismissFullScreen(_ player: OdeumPlayerView)
    func odeumDidMuted(_ player: OdeumPlayerView)
    func odeumDidUnmuted(_ player: OdeumPlayerView)
    func odeum(_ player: OdeumPlayerView, forwardedBy interval: TimeInterval)
    func odeum(_ player: OdeumPlayerView, rewindedBy interval: TimeInterval)
    func odeumDidBuffering(_ player: OdeumPlayerView)
    func odeumDidFinishedBuffering(_ player: OdeumPlayerView)
    func odeum(_ player: OdeumPlayerView, progressingBy percent: Double)
}
```

All the methods are optional

### PlayerControl

If the user taps the video player, it will show `PlayerControlView` which will control how the video will be played in `OdeumPlayerView`. You could also change the icon of the `PlayerControlView`:

```swift
odeumPlayer.playerControl.set(icon: myIcon, for: ReplayStep.fiveSecond)
```

the states are:

```swift
public enum PlayState {
    case played
    case paused
}

public enum AudioState {
    case mute
    case unmute
}

public enum ReplayStep {
    case fiveSecond
    case tenSecond
    case thirtySecond
}

public enum ForwardStep {
    case fiveSecond
    case tenSecond
    case thirtySecond
}

public enum FullScreenState {
    case fullScreen
    case minimize
}
```

To change the replay step and audio state time interval, you could assign it directly on `playerControl`:

```swift
odeumPlayer.playerControl.forwardStep = .thirtySecond
odeumPlayer.playerControl.replayStep = .thirtySecond
```

### Contribute

You know how, just clone and do pull request
