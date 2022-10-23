//
//  HomeView.swift
//  RestauranteV1
//
//  Created by Diego OM on 23/10/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false;
    
    private let imageUrl = URL(string: "https://www.dondiego.co.uk/assets/images/Don-Diego-logo.png")

    
    var body: some View {
        
        VStack{
            HStack{
                VStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.yellow.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .top)
                            .cornerRadius(40.0)
                        
                        AsyncImage(url: imageUrl,scale: 3)
                            .scaledToFit()
                            .onTapGesture {
                                isOnboardingViewActive = true
                            }

                        
                    }
                    }
                }
            
            List(0 ..< 10) { item in
                ZStack{
                    
                    HStack {
                        Circle()
                            .fill(.yellow).opacity(0.2)
                        .frame(height: 150,alignment: .top)
                        
                        VStack{
                            Text("Ensalada Cesar")
                                .fontWeight(.bold)
                                .font(.system(size: 14))
                            
                            Text("$150")
                                .fontWeight(.light)
                                .font(.system(size: 13))
                                .padding()
                        }
                    }
                        
                    
                    AsyncImage(url: URL(string: "https://www.freeiconspng.com/thumbs/food-png/food-salad-21.png"), scale: 2).position(x: 100, y: 80)
                    
                        
                        
                }
            }
        }

        }
        
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
