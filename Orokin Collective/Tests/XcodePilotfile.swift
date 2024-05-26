
import Foundation
import SwiftUI


struct User {
    var name: String
    var bio: String
    var profileImage: String
}

struct ProfileView: View {
    var user: User

    var body: some View {
        VStack(spacing: 20) {
            // Profile Image
            Image(user.profileImage)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .shadow(radius: 10)

            // Name
            Text(user.name)
                .font(.title)
                .fontWeight(.bold)

            // Bio
            Text(user.bio)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .padding()
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(name: "John Doe", 
                               bio: "iOS Developer at Example Corp.",
                               profileImage: "profile_picture"))
    }
}












