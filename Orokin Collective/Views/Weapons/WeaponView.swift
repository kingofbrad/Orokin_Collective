////
////  WeaponView.swift
////  Orokin Collective
////
////  Created by Bradlee King on 23/02/2024.
////
//
//import SwiftUI
//
//
//
//
//
//
//struct WeaponView: View {
//    let name: String
//    let image: String
//    let description: String
//    let category: String
//    let masteryReq:Int
//    let accuracy: Double
//    let fireRate: Double
//    let criticalChance: Double
//    let criticalMultiplier: Double
//    let polarities: [String]
//    let magazineSize: Int
//    let multishot: Int
//    let noise: String
//    let disposition: Int
//    let reload: Double
//    let trigger: String
//    
//    
//    let URLImage:String = "https://static.wikia.nocookie.net/warframe/images/e/ec/AcceltraPrime.png/revision/latest?cb=20240117172955"
//    
//    @GestureState private var zoom = 1.0
//    // Converts the crit chance value into a percentage and into a string
//    var totalCritChance: String {
//        let total = Double(criticalChance) / 100
////        let critValue = total / 100
//        return total.formatted(.percent)
//    }
//    
//    
//    
//    var formattedReload: String {
//        let formatter = NumberFormatter()
//        formatter.minimumIntegerDigits = 1
//        formatter.maximumFractionDigits = 1
//        
//        return formatter.string(from: NSNumber(value: reload)) ?? ""
//    }
//    
//    var formattedAccuracy: String {
//        let formatter = NumberFormatter()
//        formatter.minimumIntegerDigits = 2
//        formatter.maximumFractionDigits = 2
//        return formatter.string(from: NSNumber(value: accuracy)) ?? ""
//    }
//    var formattedFireRate: String {
//        let formatter = NumberFormatter()
//        formatter.minimumIntegerDigits = 2
//        formatter.maximumFractionDigits = 2
//        return formatter.string(from: NSNumber(value: fireRate)) ?? ""
//    } 
//    var formattedCritMulti: String {
//        let formatter = NumberFormatter()
//        formatter.minimumIntegerDigits = 1
//        formatter.maximumFractionDigits = 2
//        return formatter.string(from: NSNumber(value: criticalMultiplier )) ?? ""
//    }
//    
//    
//    
//    
//    
//    var body: some View {
//        VStack() {
//            AsyncImage(url: URL(string: image) ) { image in image.resizable() } placeholder: { Color.gray } .frame(width: 310, height: 220)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .aspectRatio(contentMode: .fit)
//                .scaleEffect(zoom)
//                .gesture(
//                    MagnifyGesture()
//                        .updating($zoom) {
//                            value, gestureState, transaction in
//                            gestureState = value.magnification
//                        }
//                )
//            
//            Divider()
//                .frame(height: 2)
//                .overlay(.orange)
//            
//            ScrollView(.vertical, showsIndicators: true) {
//                VStack(alignment:.leading){
//                        Text("Polarities Installed")
//                        .bold()
//                        Text("\(polarities.joined(separator: " "))")
//                    
//                    
//                    Divider()
//                        .frame(height: 2)
//                        .overlay(.orange)
//                    Text("\(description)")
//                    
//                    Divider()
//                        .frame(height: 2)
//                        .overlay(.orange)
//                    
//                    ScrollViewWeapon(statType: masteryReq, statName: "Mastery Req")
//                        .padding(.bottom, 5)
//                        .padding(.top, 5)
//                    Text("\(category)")
//                        .bold()
//                    HStack {
//                        Text("Accuracy")
//                        Spacer()
//                        Text(formattedAccuracy)
//                            .bold()
//                    }
//                    HStack {
//                        Text("Fire Rate")
//                        Spacer()
//                        Text(formattedFireRate)
//                            .bold()
//                    }
//                    
//                    HStack {
//                        Text("Critical Chance")
//                        Spacer()
//                        Text("\(totalCritChance)")
//                            .bold()
//                    }
//                    HStack {
//                        Text("Critical Multipler")
//                        Spacer()
//                        Text("\(formattedCritMulti)x")
//                            .bold()
//                    }
//                    ScrollViewWeapon(statType: magazineSize, statName: "Magazine")
//                    ScrollViewWeapon(statType: multishot, statName: "Multishot")
//                    HStack {
//                        Text("Noise")
//                        Spacer()
//                        Text("\(noise)")
//                            .bold()
//                    }
//                    HStack {
//                        Text("Riven Disposition")
//                        Spacer()
//                        RivenDisposition(apiResponse: disposition)
//                    }
//                    HStack {
//                        Text("Reload")
//                        Spacer()
//                        Text(formattedReload)
//                            .bold()
//                    }
//                    HStack {
//                        Text("Trigger")
//                        Spacer()
//                        Text(trigger)
//                            .bold()
//                            .textCase(.uppercase)
//                    }
//                    
//                    
//                   
//                    
//                    
//                    
//                    
//                }
//            }
//            
//            Spacer()
//            
//        }
//        .padding(.horizontal)
//        .toolbar{
//            ToolbarItem(placement: .topBarTrailing) {
//                Text("\(name)")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 20)
//                    .bold()
//                    .font(.title)
//                    .textCase(.uppercase)
//            }
//        }
//        
//    }
//}
//
//struct ScrollViewWeapon: View {
//    let statType: Int
//    let statName: String
//    
//    var body: some View {
//        HStack {
//            Text(statName)
//            Spacer()
//            Text("\(statType)")
//                .bold()
//        }
//    }
//}
//
//struct DoubleWeaponView: View {
//    let statType: Double
////    
//    let statName: String
//    var body: some View {
//        HStack {
//            Text(statName)
//            Spacer()
//            Text("\(statType)")
//        }
//    }
//}
//
//
//#Preview {
//    NavigationStack {
//        WeaponView(name: "Acceltra Prime", 
//                   image: "https://static.wikia.nocookie.net/warframe/images/e/ec/AcceltraPrime.png/revision/latest?cb=20240117172955",
//                   description: "Engage your enemies with deadly speed. This weapon reloads even faster when its wielder sprints, faster still with Gauss.",
//                   category: "Primary",
//                   masteryReq: 14,
//                   accuracy: 23.53,
//                   fireRate: 10.00,
//                   criticalChance: 34.00,
//                   criticalMultiplier: 3,
//                   polarities: ["naramon", "madurai"],
//                   magazineSize: 48,
//                   multishot: 1,
//                   noise: "Alarming",
//                   disposition: 1,
//                   reload: 1.6,
//                   trigger: "auto"
//        )
//    }
//    
//}
//
//
//struct RivenDisposition: View {
//    // Replace this with the actual API response or an example integer
//       let apiResponse: Int
//
//       var body: some View {
//           HStack(spacing: 5) {
//               ForEach(0..<5) { index in
//                   CircleView(fillCount: index < apiResponse ? index + 1 : 0)
//               }
//           }
//           .padding(.trailing, 1)
//       }
//   }
//
//   struct CircleView: View {
//       let fillCount: Int
//       let totalCircles: Int = 5
//
//       var body: some View {
//           ZStack {
//               // Outline (gray) circles
//               ForEach(0..<totalCircles) { index in
//                   Circle()
//                       .stroke(Color.gray, lineWidth: 2)
//                       .opacity(index >= fillCount ? 1.0 : 0.3)
//                       .frame(width: 10, height: 10)
//               }
//
//               // Filled circles
//               ForEach(0..<fillCount) { index in
//                   Circle()
//                       .fill(Color.gray)  // Change the fill color as needed
//                       .overlay(Circle().stroke(Color.gray, lineWidth: 2))
//                       .frame(width: 10, height: 10)
//               }
//           }
//       }
//   }
//
