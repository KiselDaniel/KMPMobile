import SwiftUI
import shared

struct ContentView: View {
    
    @StateObject
    var viewModel = HomeViewModel()

    var body: some View {
        VStack {
            if (viewModel.response?.isSuccess() == true) {
                List(viewModel.response?.getProducts().items ?? [], id: \.id) { elem in
                    ProductView(product: elem)
                }
                
            } else if (viewModel.response?.isError() == true) {
                VStack {
                    Spacer()
                    Text("\(viewModel.response?.getErrorMessage() ?? "Unknown Error!")")
                        .fontWeight(.bold)
                        .font(.title3)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            } else if(viewModel.response?.isLoading() == true) {
                VStack {
                    Spacer()
                    ProgressView("Loading")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }.task {
            await viewModel.fetchData()
        }
	}
}

class HomeViewModel: ObservableObject {
    @Published
    private (set) var response: RequestState? = nil
    
    @MainActor
    func fetchData() async {
        for await requestState in ProductsApi().fetchProducts(limit: 15) {
            response = requestState
        }
    }
}
