//
//  SyndicatesView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 26/03/2024.
//

import SwiftUI


enum SyndicateSigil: String, CaseIterable {
    case Ostrons
    case Solaris_United = "Solaris United"
    case Entrati
    case Nightwave
    case Simaris
    
}


struct SyndicatesView: View {
    var networkModel: NetworkCall
    @State  var ostronBounties: Bool = false
    @State  var solarisBounties: Bool = false
    @State  var entratiBounties: Bool = false
    @State  var nightwaveBounties: Bool = false
    @State  var simarisBounties: Bool = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                if let nightwave = networkModel.worldState?.nightwave {
                    SyndicateCard(faction: "Nightwave", subHeadline: "", factionColor: .crownOfThorns, imageSize: CGSize(width: 50, height: 50), textColor: .cornflowerLilac, season: nightwave.season, showTimer: true, expiry: nightwave.expiry, footNote: "")
                        .onTapGesture {
                            nightwaveBounties.toggle()
                        }
                        .fullScreenCover(isPresented: $nightwaveBounties, content: {
                            NightwaveMissionView(isPresented: $nightwaveBounties, faction: "Nightwave", factionColor: .crownOfThorns, imageSize: CGSize(width: 50, height: 50), textColor: .cornflowerLilac, activeChallenge: nightwave.activeChallenges, expiry: "")
                        })
                }
                
                
                if let firstMission = networkModel.worldState?.syndicateMissions.first {
                    HStack {
                        Text("Bounties refresh in:")
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                        Spacer()
                        CountdownView(expiryDateString: firstMission.expiry)
                            .font(.system(size: 18))
                    }
                }
                
                ForEach(networkModel.worldState?.syndicateMissions as? [SyndicateMission] ?? [], id: \.id) { mission in
                    
                    if mission.syndicate == "Ostrons" {
                        SyndicateCard(faction: mission.syndicate, subHeadline: "Tap to view bounites", factionColor: .desert, imageSize: CGSize(width: 60, height: 74.44), textColor: .raffia, season: 0, showTimer: false, expiry: "", footNote: "")
                            .onTapGesture {
                                ostronBounties.toggle()
                            }
                            .fullScreenCover(isPresented: $ostronBounties, content: {
                                SyndicateBountyView(isPresented: $ostronBounties, faction: mission.syndicate, factionColor: .desert,imageSize: CGSize(width: 60, height: 74.44), textColor: .raffia, job: mission.jobs )
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    
                            })
                    }
                    if mission.syndicate == "Solaris United" {
                        SyndicateCard(faction: mission.syndicate,subHeadline: "Tap to view bounites" ,factionColor: .shingleFawn, imageSize: CGSize(width: 60, height: 69), textColor: .straw, season: 0, showTimer: false, expiry: "", footNote: "")
                            .onTapGesture {
                                solarisBounties.toggle()
                            }
                            .fullScreenCover(isPresented: $solarisBounties, content: {
                                SyndicateBountyView(isPresented: $solarisBounties, faction: mission.syndicate, factionColor: .shingleFawn, imageSize: CGSize(width: 60, height: 69), textColor: .straw, job: mission.jobs)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                               
                            })
                    }
                    if mission.syndicate == "Entrati" {
                        SyndicateCard(faction: mission.syndicate,subHeadline: "Tap to view bounites"  ,factionColor: .trout, imageSize: CGSize(width: 60, height: 53), textColor: .marigold, season: 0, showTimer: false, expiry: "", footNote: "")
                            .onTapGesture {
                                entratiBounties.toggle()
                            }
                            .fullScreenCover(isPresented: $entratiBounties, content: {
                                SyndicateBountyView(isPresented: $entratiBounties, faction: mission.syndicate, factionColor: .trout, imageSize: CGSize(width: 60, height: 53), textColor: .marigold, job: mission.jobs)
                            })
                    }
                }
                Divider()
                    .frame(height:3)
                    .foregroundStyle(.white)
                    .background(.white)
                SyndicateCard(faction: "Simaris", subHeadline: "Tap to view targets", factionColor: .cafeRoyale, imageSize: CGSize(width: 50, height: 40.09), textColor: .chalky, season: 0, showTimer: false, expiry: "", footNote: "")
                    .onTapGesture {
                        simarisBounties.toggle()
                    }
                    .fullScreenCover(isPresented: $simarisBounties, content: {
                        SimarisTargetView(isPresented: $simarisBounties)
                    })
            }
            
        }
        .frame(maxWidth:.infinity)
        .padding(.top, 50)
        .padding(.horizontal, 10)
        .scrollIndicators(.hidden)
    }
    
    
    
}









#Preview {
    SyndicatesView(networkModel: NetworkCall())
}



