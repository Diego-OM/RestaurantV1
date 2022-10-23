//
//  OnboardingView.swift
//  RestauranteV1
//
//  Created by Diego OM on 23/10/22.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true;
    
    private let imageUrl = URL(string: "https://www.dondiego.co.uk/assets/images/Don-Diego-logo.png")
    
    @State private var buttonWidth = UIScreen.main.bounds.width - 80
    @State private var buttonOffset : CGFloat = 0
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            
            Color(.yellow).opacity(0.8)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                
                AsyncImage(url: imageUrl,scale: 1.3)
                    .aspectRatio(contentMode: .fit)
                      
                ZStack {
                        Capsule()
                        .fill(Color.yellow.opacity(0.2))
                    
                        Capsule()
                        .fill(Color.yellow.opacity(0.7))
                        .padding(8)
                        
                   
                    HStack(){
                        Capsule()
                        .fill(Color.red).opacity(0.5)
                        .frame(width: buttonOffset + 80)
                    
                        Spacer()
                       }
              
                    Text("Iniciar")
                        .font(.system(size: 19))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .offset(x:20)
                        
                //Circle Draggable
                HStack {
                    ZStack{
                        Circle()
                            .fill(.red)
                        Circle()
                            .fill(.black.opacity(0.15))
                            .padding(8)
                        Image(systemName: "chevron.right.2")
                            .font(.system(size: 24, weight: .bold))
                        }
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .offset(x: buttonOffset)
                    .gesture(
                        DragGesture()
                            .onChanged{
                                gesture in
                                if gesture.translation.width > 0
                                && buttonOffset <= buttonWidth - 80{
                                    buttonOffset = gesture.translation.width
                                }
                            }.onEnded{ _ in
                                if buttonOffset > buttonWidth / 2{
                                    buttonOffset = buttonWidth - 80
                                    isOnboardingViewActive = false
                                }else{
                                    buttonOffset = 0

                                }                            }
                    )
                Spacer()
                }
                }
                .frame(width:buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeInOut(duration: 3), value: isAnimating)
            }
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeInOut(duration: 3), value: isAnimating)
        }
        .onAppear(perform: {
          isAnimating = true
        })
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

