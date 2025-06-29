# iOS Calculator App

A beautiful, native iOS calculator app built with SwiftUI, featuring Apple's design language and aesthetic.

## Features

- **Native iOS Design**: Built with SwiftUI using Apple's Human Interface Guidelines
- **Dark Mode**: Optimized for dark mode with beautiful gradients and colors
- **Responsive Layout**: Adapts to different screen sizes and orientations
- **Smooth Animations**: Subtle animations and haptic feedback for a premium feel
- **Full Calculator Functionality**: 
  - Basic arithmetic operations (+, -, ×, ÷)
  - Percentage calculations
  - Sign toggle (±)
  - Decimal point support
  - Clear and All Clear functionality
  - Error handling for division by zero

## Design Highlights

- **Apple's Design Language**: Follows iOS design principles with proper spacing, typography, and colors
- **Circular Buttons**: Beautiful circular buttons with proper touch targets
- **Dynamic Typography**: Responsive text sizing that adapts to content
- **Visual Feedback**: Selected operator highlighting and button press animations
- **Gradient Background**: Subtle gradient background for depth
- **Proper Contrast**: High contrast ratios for accessibility

## Technical Implementation

### Architecture
- **MVVM Pattern**: Clean separation of concerns with ViewModel
- **SwiftUI**: Modern declarative UI framework
- **ObservableObject**: Reactive data binding
- **@Published Properties**: Automatic UI updates

### Key Components
- `CalculatorApp.swift`: Main app entry point
- `ContentView.swift`: Main UI layout and button grid
- `CalculatorViewModel.swift`: Business logic and state management
- `CalculatorButton.swift`: Reusable button component
- `DisplayView.swift`: Calculator display component

### Native iOS Technologies Used
- **SwiftUI**: Modern UI framework
- **Combine**: Reactive programming (via @Published)
- **Core Graphics**: Custom button styling
- **Haptic Feedback**: Native iOS haptics
- **Dynamic Type**: Accessibility support
- **Safe Area**: Proper layout handling

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Installation

1. Open the project in Xcode
2. Select your target device or simulator
3. Build and run the project (⌘+R)

## Project Structure

```
iOS-Calculator/
├── Calculator/
│   ├── CalculatorApp.swift          # App entry point
│   ├── ContentView.swift            # Main UI
│   ├── CalculatorViewModel.swift    # Business logic
│   ├── Info.plist                   # App configuration
│   └── Assets.xcassets/             # App icons and colors
├── Calculator.xcodeproj/            # Xcode project file
└── README.md                        # This file
```

## Features in Detail

### Calculator Operations
- **Basic Math**: Addition, subtraction, multiplication, division
- **Advanced Functions**: Percentage, sign toggle
- **Input Handling**: Decimal points, number formatting
- **Error Handling**: Division by zero protection
- **State Management**: Proper calculator state tracking

### UI/UX Features
- **Responsive Design**: Works on all iPhone and iPad sizes
- **Orientation Support**: Portrait and landscape modes
- **Accessibility**: VoiceOver support and proper contrast
- **Haptic Feedback**: Tactile response for button presses
- **Smooth Animations**: 60fps animations and transitions

## Design Philosophy

This calculator app embodies Apple's design principles:

1. **Clarity**: Clean, uncluttered interface
2. **Deference**: Content-focused design
3. **Depth**: Subtle visual hierarchy and layering

The app uses:
- **SF Pro Display**: Apple's system font
- **System Colors**: Native iOS color palette
- **Standard Spacing**: Consistent 8pt grid system
- **Proper Touch Targets**: Minimum 44pt touch areas

## Future Enhancements

Potential features for future versions:
- Scientific calculator functions
- History and memory features
- Custom themes and colors
- Widget support
- Apple Watch companion app
- iCloud sync for settings

## Contributing

This is a demonstration project showcasing native iOS development with SwiftUI. Feel free to use this as a reference for your own projects.

## License

This project is for educational and demonstration purposes. 