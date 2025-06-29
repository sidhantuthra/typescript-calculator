import SwiftUI
import CoreHaptics

struct ContentView: View {
    @StateObject private var calculator = CalculatorViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(.systemBackground),
                        Color(.systemGray6)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Display area
                    DisplayView(displayText: calculator.displayText)
                        .frame(height: geometry.size.height * 0.3)
                    
                    // Buttons area
                    CalculatorButtonsView(calculator: calculator)
                        .frame(height: geometry.size.height * 0.7)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct DisplayView: View {
    let displayText: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            Spacer()
            
            Text(displayText)
                .font(.system(size: 64, weight: .light, design: .default))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 32)
                .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct CalculatorButtonsView: View {
    @ObservedObject var calculator: CalculatorViewModel
    
    private let buttonSpacing: CGFloat = 12
    private let buttonSize: CGFloat = 80
    
    var body: some View {
        VStack(spacing: buttonSpacing) {
            // Row 1: AC, ±, %, ÷
            HStack(spacing: buttonSpacing) {
                CalculatorButton(
                    title: calculator.isAllClear ? "AC" : "C",
                    type: .function,
                    action: { calculator.clear() }
                )
                .animation(.easeInOut(duration: 0.1), value: calculator.isAllClear)
                
                CalculatorButton(
                    title: "±",
                    type: .function,
                    action: { calculator.toggleSign() }
                )
                
                CalculatorButton(
                    title: "%",
                    type: .function,
                    action: { calculator.percentage() }
                )
                
                CalculatorButton(
                    title: "÷",
                    type: .operation,
                    isSelected: calculator.selectedOperator == .divide,
                    action: { calculator.setOperator(.divide) }
                )
            }
            
            // Row 2: 7, 8, 9, ×
            HStack(spacing: buttonSpacing) {
                CalculatorButton(
                    title: "7",
                    type: .number,
                    action: { calculator.appendNumber("7") }
                )
                
                CalculatorButton(
                    title: "8",
                    type: .number,
                    action: { calculator.appendNumber("8") }
                )
                
                CalculatorButton(
                    title: "9",
                    type: .number,
                    action: { calculator.appendNumber("9") }
                )
                
                CalculatorButton(
                    title: "×",
                    type: .operation,
                    isSelected: calculator.selectedOperator == .multiply,
                    action: { calculator.setOperator(.multiply) }
                )
            }
            
            // Row 3: 4, 5, 6, -
            HStack(spacing: buttonSpacing) {
                CalculatorButton(
                    title: "4",
                    type: .number,
                    action: { calculator.appendNumber("4") }
                )
                
                CalculatorButton(
                    title: "5",
                    type: .number,
                    action: { calculator.appendNumber("5") }
                )
                
                CalculatorButton(
                    title: "6",
                    type: .number,
                    action: { calculator.appendNumber("6") }
                )
                
                CalculatorButton(
                    title: "-",
                    type: .operation,
                    isSelected: calculator.selectedOperator == .subtract,
                    action: { calculator.setOperator(.subtract) }
                )
            }
            
            // Row 4: 1, 2, 3, +
            HStack(spacing: buttonSpacing) {
                CalculatorButton(
                    title: "1",
                    type: .number,
                    action: { calculator.appendNumber("1") }
                )
                
                CalculatorButton(
                    title: "2",
                    type: .number,
                    action: { calculator.appendNumber("2") }
                )
                
                CalculatorButton(
                    title: "3",
                    type: .number,
                    action: { calculator.appendNumber("3") }
                )
                
                CalculatorButton(
                    title: "+",
                    type: .operation,
                    isSelected: calculator.selectedOperator == .add,
                    action: { calculator.setOperator(.add) }
                )
            }
            
            // Row 5: 0, ., = (spanning 2 columns)
            HStack(spacing: buttonSpacing) {
                CalculatorButton(
                    title: "0",
                    type: .number,
                    action: { calculator.appendNumber("0") }
                )
                
                CalculatorButton(
                    title: ".",
                    type: .number,
                    action: { calculator.appendDecimal() }
                )
                
                CalculatorButton(
                    title: "=",
                    type: .equals,
                    isWide: true,
                    action: { calculator.calculate() }
                )
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
    }
}

struct CalculatorButton: View {
    let title: String
    let type: ButtonType
    let isSelected: Bool
    let isWide: Bool
    let action: () -> Void
    
    init(
        title: String,
        type: ButtonType,
        isSelected: Bool = false,
        isWide: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.type = type
        self.isSelected = isSelected
        self.isWide = isWide
        self.action = action
    }
    
    private func triggerHaptic() {
        DispatchQueue.main.async {
            let impactFeedback = UIImpactFeedbackGenerator(style: .light)
            impactFeedback.prepare()
            impactFeedback.impactOccurred()
        }
    }
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            action()
        }) {
            Text(title)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(type.textColor)
                .frame(
                    width: isWide ? (80 * 2 + 12) : 80, // 2 buttons + spacing
                    height: 80
                )
                .background(
                    Group {
                        if isWide {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(type.backgroundColor(isSelected: isSelected))
                        } else {
                            Circle()
                                .fill(type.backgroundColor(isSelected: isSelected))
                        }
                    }
                )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isSelected ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isSelected)
    }
}

enum ButtonType {
    case number
    case operation
    case function
    case equals
    
    func backgroundColor(isSelected: Bool = false) -> Color {
        switch self {
        case .number:
            return Color(.systemGray3)
        case .operation:
            return isSelected ? .white : .orange
        case .function:
            return Color(.systemGray5)
        case .equals:
            return .orange
        }
    }
    
    var textColor: Color {
        switch self {
        case .number, .function:
            return .white
        case .operation, .equals:
            return .white
        }
    }
}

#Preview {
    ContentView()
} 