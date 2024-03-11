//
//  SplineLoginView.swift
//  RecipeApp
//
//  Created by Brandon on 3/1/24.
//

import SwiftUI
import SplineRuntime

struct SplineLoginView: View {
    var body: some View {
        VStack {
           
            
                SplineTestView()
                    .foregroundStyle(.gray)
                    .frame(height: 480)
                    .ignoresSafeArea()
            
            
            Spacer()
            
            VStack(spacing: 25) {
                Text("Build Your Recipe")
                    .font(.title.bold())
                
                Text("This is an interactive recipe app that allows you to find joy in creating your own recipe library")
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Get Started")
                })
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Spacer()
                
            }
            .padding()
        }
    }
}

#Preview {
    SplineLoginView()
}

import SplineRuntime
import SwiftUI



struct SplineTestView: View {
    var body: some View {
                let url = URL(string: "https://build.spline.design/N6BKKcz-3MFltowd13Mu/scene.splineswift")!

                // // fetching from local
                // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

                try? SplineView(sceneFileURL: url).ignoresSafeArea(.all)
        
    }
}
