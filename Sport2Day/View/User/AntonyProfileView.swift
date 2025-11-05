//
//  AntonyProfileView.swift
//  Sport2Day
//
//  Created by Emilie on 05/11/2025.
//


import SwiftUI

struct AntonyProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
          
            
            ZStack {
                
                Color(.bluePrimary)
                    .ignoresSafeArea()
                ScrollView {
                    
// BOUTON DE FERMETURE POPUP
                        ZStack(alignment: .trailing) {
                            Button {
                                dismiss()
                            } label: {
                                Spacer()
                                Image(systemName: "xmark")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(12)
                                    .background(.ultraThinMaterial, in: Circle())
                            }
                        }
                        .padding()
                    
                    VStack {
                        ZStack(alignment: .top) {
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(Color.white, lineWidth: 2)
                                .foregroundColor(.bluePrimary)
                                .frame(width: 340, height : 360)
                            
                            // GENRE
                                .overlay(
                                    VStack(spacing: 4) {
                                        ZStack{
                                            RoundedRectangle(cornerRadius : 8)
                                                .fill(Color.white)
                                                .frame(width: 50, height : 50)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 8) .stroke(Color.white, lineWidth : 2))
                                            
                                            Image("queerGenderDark")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 40, height: 40)

                                        }
                                    }
                                        .frame(width: 80, height: 80)
                                        .padding(.trailing, -35)
                                        .padding(.top, 120),
                                    alignment : .topTrailing
                                )
                            
                            // NOM PROFIL
                                .overlay(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.orangePrimary)
                                            .frame(width : 200, height : 60)
                                        Text("ANTON96")
                                            .foregroundColor(.white)
                                            .font(.title)
                                            .fontWeight(.bold)
                                    }
                                        .padding(.top, -30),
                                    alignment : .top
                                )
                            // PHOTO
                            VStack {
                                Spacer()
                                Image("antony")
                                    .resizable()
                                    .scaledToFit()
                                    .frame( width: 200, height: 200)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth : 1)
                                    )
                                
                                // BIO
                                Text("Coach en musculation \n et fitness 🌈")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .italic()
                                    .padding(.top, 16)
                                
                                Spacer()
                                
                            }
                            .frame(width: 400, height: 360)
                            
                            // MINDSET
                            VStack{
                                HStack(spacing: 12) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.white)
                                            .frame(width: 90, height: 40)
                                        Text("INCLUSION")
                                            .font(.custom("BebasNeue-Regular", size: 20))
                                            .foregroundColor(.bluePrimary)
                                    }
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.white)
                                            .frame(width: 90, height: 40)
                                        Text("PATIENCE")
                                            .font(.custom("BebasNeue-Regular", size: 20))
                                            .foregroundColor(.bluePrimary)
                                    }
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.white)
                                            .frame(width: 90, height: 40)
                                        Text("RIGUEUR")
                                            .font(.custom("BebasNeue-Regular", size: 20))
                                            .foregroundColor(.bluePrimary)
                                    }
                                }
                                .frame(height: 30)
                                .padding(.top, 360 - 15)
                            }
                        }
                        // STATS
                        VStack {
                            Text("Stats")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .padding(.top, 24)
                        .padding(.horizontal, 8)
                        
                        // BADGE ORGANISATION
                        HStack(spacing: 30){
                            VStack(alignment: .center, spacing: 4) {
                                Image("captainBadge")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text("CAPITAINE")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text("Organisation de \n 16 activités")
                                    .foregroundStyle(.white)
                                    .font(.callout)
                                    .italic()
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 4)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.captainGold, lineWidth: 2)
                                    .frame(width: 160, height : 160)
                                    .padding()
                            )
                            .padding()
                            
                            // BADGE PARTICIPATION:
                            VStack(alignment: .center, spacing: 4) {
                                Image("amatorBadge")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text("AMATEUR")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text("Participation à \n 6 activités")
                                    .foregroundStyle(.white)
                                    .font(.callout)
                                    .italic()
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 4)
                            }
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.amatorBronze, lineWidth: 2)
                                    .frame(width: 160, height : 160)
                                    .padding()
                            )
                        }
                        
                        // SPORT PRATIQUÉ 1
                        
                        VStack(alignment: .leading) {
                            Text("Sports pratiqués")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.containerGray)
                                    .frame(width: 350, height: 80)
                                HStack(spacing: 16) {
                                    Image(systemName:"dumbbell.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 32))
                                    Text("12 évènements effectués")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        .padding(.top)
                        
                        // SPORT PRATIQUÉ 2
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.containerGray)
                                .frame(width: 350, height: 80)
                            HStack(spacing: 16) {
                                Image(systemName:"figure.run")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                Text("8 évènements effectués")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.top, 4)
                        
                        // SPORT PRATIQUÉ 3
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.containerGray)
                                .frame(width: 350, height: 80)
                            HStack(spacing: 16) {
                                Image(systemName:"soccerball.inverse")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                Text(" 3 évènements effectués")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.top, 4)
                        
                        // SPORT PRATIQUÉ 4
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.containerGray)
                                .frame(width: 350, height: 80)
                            HStack(spacing: 16) {
                                Image(systemName:"questionmark.app.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                Text(" 3 évènements effectués")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.top, 4)
                    }
                }
            }
        }
    }


#Preview {
   AntonyProfileView()
}

