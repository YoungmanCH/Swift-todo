import SwiftUI

struct ContentView: View {
    @State private var isShowSecondView = false
    @State private var isShowMediumModal = false
    @State private var isShowFullScreenModal = false
    
    var body: some View {
        NavigationStack {
            VStack() {
                // Navigation移動
                NavigationLink {
                    SecondView()
                } label: {
                    Text("Move to second view with navigation.")
                }
                
                // Modal移動
                Button {
                    isShowSecondView = true
                } label: {
                    Text("Move to second view with modal.")
                }
                .padding()
                .sheet(isPresented: $isShowSecondView) {
                    SecondView()
                }
                
                // 半分のサイズでModal移動
                Button {
                    isShowMediumModal = true
                } label: {
                    Text("Move to second view with modal by medium.")
                }
                .padding()
                .sheet(isPresented: $isShowMediumModal) {
                    SecondView()
                        .presentationDetents([.medium])
                }
                
                // Full screenでModal移動
                Button {
                    isShowFullScreenModal = true
                } label: {
                    Text("Move to second view with modal by full screen.")
                }
                .padding()
                .fullScreenCover(isPresented: $isShowFullScreenModal) {
                    SecondView()
                }
            }
            .padding()
            // Navigationの左上のタイトル。h1サイズです。
            .navigationTitle("Index View")
        }
    }
}

#Preview {
    ContentView()
}
