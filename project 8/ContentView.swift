//
//  ContentView.swift
//  project 8
//
//  Created by Anisha Lamichhane on 5/16/21.
//

import SwiftUI

struct CustomText: View {
    var text: String
    var body: some View {
        Text(text)
    }
    init(_ text: String) {
        print("Creating a custom text")
        self.text = text
    }
    
}

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 10){
                ForEach(0..<100){
                    CustomText("Item\($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
