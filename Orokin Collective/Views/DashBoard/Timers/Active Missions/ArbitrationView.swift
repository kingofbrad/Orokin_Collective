import SwiftUI

struct ArbitrationView: View {
    @ObservedObject private var networkCall = NetworkCall()
    var arbitrationDataImage: String = "https://static.wikia.nocookie.net/warframe/images/b/b9/VitusEssence.png/revision/latest?cb=20221130055924"
    
    var body: some View {
        VStack {
            if let arbitrationData = networkCall.arbitrationData {
                
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: arbitrationDataImage)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .padding(.all, 20)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(height: 150)
                    VStack(alignment: .leading) {
                        Text(arbitrationData.node)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text(arbitrationData.enemy)
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .foregroundColor(.gray)
                        Divider()
                            .background(.white)
                        Text(arbitrationData.type)
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .foregroundColor(.gray)
                        Text("Is Expired: \(arbitrationData.expired ? "Yes" : " No")")
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .foregroundColor(.gray)
                        
                    }
                    .padding(.trailing, 20)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(red: 32/255, green: 36/255, blue: 38/255))
                .modifier(CardModifier())
                .padding(.all, 10)
                
            } else {
                Text("Loading....")
            }
            
        }
        .padding()
        .task {
            do {
                try await networkCall.fetchArbitrationData()
            } catch APIError.invalidURL {
                print("invalid URL")
            } catch APIError.invaildResponse {
                print("invaild Response")
            } catch APIError.invalidData {
                print("invaild Data")
            } catch {
                print("Unexcepted Error has appeared \(error)")
            }
        }
    }

   
}

struct ArbitrationView_Previews: PreviewProvider {
    static var previews: some View {
        ArbitrationView()
    }
}


struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}
