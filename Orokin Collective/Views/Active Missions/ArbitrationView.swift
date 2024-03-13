import SwiftUI

struct ArbitrationView: View {
//    @ObservedObject private var avm = ArbitrationViewModel()
    @ObservedObject private var networkCall = NetworkCall()
    
    var body: some View {
        VStack {
            if let arbitrationData = networkCall.arbitrationData {
                Text("Enemy: \(arbitrationData.enemy)")
                Text("Type: \(arbitrationData.type)")
                Text("Node: \(arbitrationData.node)")
                
                HStack {
                   Text("Is Expired:")
                    Text(arbitrationData.expired ? "Yes" : "No")
                }
               
                // Add more Text views for other information you want to display
            } else {
                Text("Loading....")
                    .onAppear(perform: networkCall.fetchArbData)
            }
        }
        .padding()
    }

   
}

struct ArbitrationView_Previews: PreviewProvider {
    static var previews: some View {
        ArbitrationView()
    }
}
