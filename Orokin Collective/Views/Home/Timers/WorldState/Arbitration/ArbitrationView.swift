import SwiftUI

struct ArbitrationView: View {
    @ObservedObject private var networkModel = NetworkCall()
   
    var body: some View {
        VStack {
//            if let arbitrationData = networkModel.worldState?.arbitration {
//                VStack {
//                    HStack{
//                        Image("Vitus")
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                            .padding(.trailing, 2)
//                        VStack(alignment: .leading, spacing: 2){
//                            Text("\(arbitrationData.node)")
//                                .font(.system(size: 14))
//                                .bold()
//                            Text("\(arbitrationData.enemy)")
//                                .font(.system(size: 14))
//                                .foregroundStyle(.silverChalice)
//                            Text("\(arbitrationData.type.capitalized)")
//                                .font(.system(size: 14))
//                                .foregroundStyle(.silverChalice)
//                        }
//                        Spacer()
//                        CountdownView(expiryDateString: arbitrationData.expiry)
//                    }
//                    .padding(.horizontal)
//
//                }
//                .frame(width: 346, height: 80)
//                .background(Color.blueCharcoal)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//
//            } else if networkModel.showError || networkModel.arbitration?.expired == true {
//                EmptyView()
//            }
        }
//        .task {
//            do {
//                try await networkModel.fetchArbitrationData()
//            } catch APIError.invalidURL {
//                print("invalid URL")
//            } catch APIError.invaildResponse {
//                print("invaild Response")
//            } catch APIError.invalidData {
//                print("invaild Data")
//            } catch {
//                print("Unexcepted Error has appeared \(error)")
//            }
//        }
    }
   
    
    
    
    
}

struct ArbitrationView_Previews: PreviewProvider {
    static var previews: some View {
        ArbitrationView()
    }
}


