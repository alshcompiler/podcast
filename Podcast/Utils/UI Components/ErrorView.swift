import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    let retryAction: () -> Void
    
    private enum Constants {
        static let retryText = "Retry"
    }
    
    var body: some View {
        VStack {
            Text(errorMessage)
                .foregroundColor(.red)
            Button(Constants.retryText) {
                retryAction()
            }
            .padding()
        }
    }
}

#Preview {
    ErrorView(
        errorMessage: "Something went wrong",
        retryAction: {}
    )
} 