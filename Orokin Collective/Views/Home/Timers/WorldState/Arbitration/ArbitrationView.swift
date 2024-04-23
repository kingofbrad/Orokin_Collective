import SwiftUI

struct ArbitrationView: View {
    var networkModel: NetworkCall
    
    var body: some View {
        VStack {
            if let arbitrationData = getArbitrationData() {
                VStack {
                    HStack {
                        Image("Vitus")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            
                            Text(arbitrationData.node)
                                .font(.system(size: 16))
                                .bold()
                            
                            
                           
                            
                            
                            Text(arbitrationData.type.capitalized)
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                            
                        }
                        Spacer()
                        CountdownView(expiryDateString: arbitrationData.expiry)
                    }
                    .padding(.horizontal, 5)
                    
                }
                .padding()
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            } else {
                Text("No arbitration data available.")
                    .foregroundColor(.red)
            }
        }
    }
    @MainActor func getArbitrationData() -> Arbitration? {
        if let worldState = networkModel.worldState {
            return worldState.arbitration
        } else {
            return nil
        }
    }
}




struct ArbitrationView_Previews: PreviewProvider {
    static var previews: some View {
        ArbitrationView(networkModel: NetworkCall())
    }
}


