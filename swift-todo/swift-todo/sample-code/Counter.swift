import SwiftUI

class GlobalCount: ObservableObject {
    @Published var count: Int
    
    init(count: Int) {
        self.count = count
    }
}

struct ContentView: View {
    @State public var count: Int = 0
    @State private var isShownSecondView: Bool = false
    @ObservedObject private var globalCount = GlobalCount(count: 0)
    
    var body: some View {
        VStack {
            HStack {
                Button("-") {
                    if (count > 0) {
                        count -= 1
                        globalCount.count -= 1
                    }
                }
                Text("Counter: \(count)")
                Text("gCounter: \(globalCount.count)")
                Button("+") {
                    count += 1
                    globalCount.count += 1
                }
            }
            .padding()
            Button("Move to second view."){
                isShownSecondView = true
            }.sheet(isPresented: $isShownSecondView) {
                SecondView(count: $count, globalCount: globalCount)
            }
        }
        .font(.title)
    }
}

struct SecondView: View {
    @Binding var count: Int
    @ObservedObject var globalCount: GlobalCount
    
    var body: some View {
        Button("+10") {
            count += 10
            globalCount.count += 10
        }
        .font(.title)
    }
}

#Preview {
    ContentView()
}
