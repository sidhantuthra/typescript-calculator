# iOS Calculator Setup Instructions

Since the automatic Xcode project creation had some issues, here's how to set up the project manually:

## Option 1: Create New Xcode Project (Recommended)

1. **Open Xcode**
2. **Create a new project**:
   - File → New → Project
   - Choose "iOS" → "App"
   - Product Name: `Calculator`
   - Interface: `SwiftUI`
   - Language: `Swift`
   - Click "Next" and choose your save location

3. **Replace the default files**:
   - Replace `ContentView.swift` with our version
   - Add `CalculatorViewModel.swift` to the project
   - Update `CalculatorApp.swift` if needed

## Option 2: Use Command Line (Alternative)

If you prefer command line, you can also create the project using:

```bash
# Navigate to the iOS-Calculator directory
cd iOS-Calculator

# Create a new Xcode project using xcodebuild
xcodebuild -project . -list
```

## Option 3: Open in Xcode as Swift Files

You can also open the Swift files directly in Xcode:

1. Open Xcode
2. File → Open
3. Navigate to the `iOS-Calculator/Calculator` folder
4. Select all Swift files and open them
5. Create a new iOS App project and add these files to it

## Files to Add to Your Project

Make sure these files are included in your Xcode project:

- `CalculatorApp.swift` - Main app entry point
- `ContentView.swift` - Main UI with beautiful calculator design
- `CalculatorViewModel.swift` - Business logic and state management
- `Info.plist` - App configuration (if not auto-generated)
- `Assets.xcassets` - App icons and colors

## Build and Run

Once you have the project set up:

1. Select your target device or simulator
2. Press ⌘+R to build and run
3. The beautiful calculator app should launch!

## Troubleshooting

If you encounter any issues:

1. Make sure all Swift files are added to the project target
2. Check that the deployment target is iOS 17.0+
3. Verify that SwiftUI is selected as the interface
4. Clean build folder (⌘+Shift+K) and rebuild

The app features:
- Beautiful Apple design language
- Dark mode optimization
- Smooth animations
- Full calculator functionality
- Responsive layout for all devices 