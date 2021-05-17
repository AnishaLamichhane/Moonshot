//
//  ContentView.swift
//  project 8
//
//  Created by Anisha Lamichhane on 5/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(0..<100){ row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
                
            }
            navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
