import SwiftUI

struct ContentView: View {
    // デバイスのサイズを取得
    let deviceWidth = UIScreen.main.bounds.width
    let deviceHeight = UIScreen.main.bounds.height
    
    @State private var randomNumber: Int = 1
    @State private var timer: Timer?
    @State private var isRolling: Bool = false
    
    private func _playDice() {
        _startDice()
        _stopDice()
    }
    
    private func _startDice() {
        _setIsRollig()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            randomNumber = _setRandomNumber()
        }
    }
    
    private func _setRandomNumber() -> Int {
        return Int.random(in: 1...6)
    }
    
    private func _stopDice() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            timer?.invalidate()
            timer = nil
            _setIsRollig()
        }
    }
    
    private func _setIsRollig() {
        isRolling = !isRolling
    }
    
    var body: some View {
        VStack() {
            Spacer()
            // .scaledToFit(): 画像の縦横の幅を統一させる。
            Image(systemName: "die.face.\(randomNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: deviceWidth / 2)
                .padding()
            Spacer()
            Button {
                _playDice()
            } label: {
                Text("サイコロを振る")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }.disabled(isRolling)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
