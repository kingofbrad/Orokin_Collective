import SwiftUI

struct ArbitrationView: View {
    @State private var arbitrationData: Arbitration?
    

    var body: some View {
        VStack {
            if let arbitrationData = arbitrationData {
                Text("Enemy: \(arbitrationData.enemy)")
                Text("Type: \(arbitrationData.type)")
                
                HStack {
                   Text("Is Expired:")
                    Text(arbitrationData.expired ? "Yes" : "No")
                }
                // Add more Text views for other information you want to display
            } else {
                Text("Loading...")
                    .onAppear(perform: loadData)
            }
        }
        .padding()
    }

    func loadData() {
        guard let url = URL(string: "https://api.warframestat.us/pc/arbitration") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Arbitration.self, from: data)
                    DispatchQueue.main.async {
                        self.arbitrationData = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}

struct ArbitrationData: Decodable {
    // Add properties for the data you want to display
    let enemy: String
    let type: String
    // Add more properties based on the JSON structure
}

struct ArbitrationView_Previews: PreviewProvider {
    static var previews: some View {
        ArbitrationView()
    }
}
