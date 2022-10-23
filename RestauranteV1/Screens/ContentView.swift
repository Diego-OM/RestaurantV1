//
//  ContentView.swift
//  RestauranteV1
//
//  Created by Diego OM on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    private let imageUrl = "https://img.freepik.com/premium-vector/burger-logo-template_441059-21.jpg?w=2000"
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    
    var body: some View {
        
        ZStack{
            if isOnboardingViewActive{
                OnboardingView()
            }else{
                HomeView()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
