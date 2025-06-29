import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var displayText: String = "0"
    @Published var selectedOperator: CalculatorOperator?
    @Published var isAllClear: Bool = true
    
    private var currentNumber: Double = 0
    private var previousNumber: Double = 0
    private var waitingForOperand: Bool = false
    private var hasDecimal: Bool = false
    
    func appendNumber(_ number: String) {
        if waitingForOperand {
            displayText = number
            waitingForOperand = false
            hasDecimal = false
        } else {
            if displayText == "0" && number != "." {
                displayText = number
            } else {
                displayText += number
            }
        }
        
        isAllClear = false
        currentNumber = Double(displayText) ?? 0
    }
    
    func appendDecimal() {
        if waitingForOperand {
            displayText = "0."
            waitingForOperand = false
            hasDecimal = true
        } else if !hasDecimal {
            displayText += "."
            hasDecimal = true
        }
        
        isAllClear = false
    }
    
    func clear() {
        if isAllClear {
            // Clear everything
            displayText = "0"
            currentNumber = 0
            previousNumber = 0
            selectedOperator = nil
            waitingForOperand = false
            hasDecimal = false
        } else {
            // Clear current entry
            displayText = "0"
            currentNumber = 0
            hasDecimal = false
            isAllClear = true
        }
    }
    
    func toggleSign() {
        if let value = Double(displayText) {
            let newValue = -value
            displayText = formatNumber(newValue)
            currentNumber = newValue
        }
    }
    
    func percentage() {
        if let value = Double(displayText) {
            let newValue = value / 100
            displayText = formatNumber(newValue)
            currentNumber = newValue
        }
    }
    
    func setOperator(_ operator: CalculatorOperator) {
        if let selectedOperator = selectedOperator, !waitingForOperand {
            calculate()
        }
        
        previousNumber = currentNumber
        selectedOperator = `operator`
        waitingForOperand = true
        hasDecimal = false
    }
    
    func calculate() {
        guard let selectedOperator = selectedOperator else { return }
        
        let result: Double
        
        switch selectedOperator {
        case .add:
            result = previousNumber + currentNumber
        case .subtract:
            result = previousNumber - currentNumber
        case .multiply:
            result = previousNumber * currentNumber
        case .divide:
            if currentNumber == 0 {
                displayText = "Error"
                return
            }
            result = previousNumber / currentNumber
        }
        
        displayText = formatNumber(result)
        currentNumber = result
        self.selectedOperator = nil
        waitingForOperand = true
        hasDecimal = false
    }
    
    private func formatNumber(_ number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", number)
        } else {
            return String(format: "%.8f", number).replacingOccurrences(of: #"\.?0+$"#, with: "", options: .regularExpression)
        }
    }
}

enum CalculatorOperator {
    case add
    case subtract
    case multiply
    case divide
} 