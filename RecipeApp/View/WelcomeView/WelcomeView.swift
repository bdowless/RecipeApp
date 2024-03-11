//
//  WelcomeView.swift
//  RecipeApp
//
//  Created by Brandon on 3/3/24.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var WelcomeViewisOver: Bool
    @State private var scaleAmount = 1.0
    var body: some View {
        VStack {
            Text("Welcome to Recipe Builder")
                .font(.title.bold())
                
            
            Image("logo")
                .resizable()
                .scaledToFit()
         
        }
        .frame(width: 300, height: 300)
        .onAppear{
            addAnimation()
        }
        .scaleEffect(scaleAmount)
    }
}

extension WelcomeView {
    func addAnimation() {
        self.scaleAmount = 1.0
        Timer
            .scheduledTimer(withTimeInterval: 0.2, repeats: true) { Timer in
                withAnimation {
                    if scaleAmount < 1.5 {
                        scaleAmount += 0.05
                    } else {
                        Timer.invalidate()
                        WelcomeViewisOver = true
                    }
                    
                }
            }
    }
}

#Preview {
    WelcomeView(WelcomeViewisOver: .constant(false))
}
