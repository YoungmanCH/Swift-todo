import SwiftUI

class InputTextFieldModel: ObservableObject {
    @Published var placeholder = "Please input text."
    @Published var inputText: String = ""
}

class TaxCalculator: ObservableObject {
    func calculatePrice(tax: Double, price: Double) -> Double {
        let rate = transformToTax(tax: tax)
        return price * (1 + rate)
    }
    
    private func transformToTax(tax: Double) -> Double {
        return tax * 0.01
    }
}

struct ContentView: View {
    @StateObject private var InputTextField = InputTextFieldModel()
    @StateObject private var taxCalculator = TaxCalculator()
    
    @State var tax8: Double = 0.0
    @State var tax10: Double = 0.0
    @State var priceValidationError: String? = nil
    
    private func calculatePrice(tax: Double, price: Double) -> Double {
        return taxCalculator.calculatePrice(tax: tax, price: price)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            TextField(
                InputTextField.placeholder,
                text: $InputTextField.inputText
            ).keyboardType(.numberPad)
                .onChange(of: InputTextField.inputText) {
                    if let price = Double(InputTextField.inputText) {
                        tax8 = calculatePrice(tax: 8, price: price)
                        tax10 = calculatePrice(tax: 10, price: price)
                        priceValidationError = nil
                    } else {
                        priceValidationError = "Error: Please set another count"
                    }
                    
                }
            
            if priceValidationError != nil {
                Text(priceValidationError!)
            }
            Text("price:" + InputTextField.inputText)
            Text("Tax 8%: \(String(tax8))")
            Text("Tax 10%: \(String(tax10))")
        }
    }
}

#Preview {
    ContentView()
}
