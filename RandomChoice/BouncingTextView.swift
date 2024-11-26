import SwiftUI

struct BouncingTextView: View {
    @State private var hideInstructions = false
    @State private var bounce = false

    var body: some View {
        VStack {
            Text(hideInstructions ? "" : "Tap to roll")
                .foregroundColor(.green)
                .offset(y: bounce ? -10 : 10)
                .animation(
                    Animation
                        .easeInOut(duration: 0.5)
                        .repeatForever(autoreverses: true),
                    value: bounce
                )
                .onAppear {
                    bounce = true
                }
                .onTapGesture {
                    withAnimation {
                        hideInstructions = true
                    }
                }

            Button(action: {
                withAnimation {
                    hideInstructions.toggle()
                }
            }) {
                Text("Toggle Instructions")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct BouncingTextView_Previews: PreviewProvider {
    static var previews: some View {
        BouncingTextView()
    }
}