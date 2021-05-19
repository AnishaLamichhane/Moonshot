//
//  ContentView.swift
//  project 8
//
//  Created by Anisha Lamichhane on 5/16/21.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State var showingDate = true
    
    var body: some View {
        
        NavigationView {
            List(missions){ mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading){
                        Text(mission.displayName)
                            .font(.headline)
                        if self.showingDate {
                            Text(mission.formattedLaunchDate)
                            
                        }  else {
                            Text(mission.crewNames(astronauts: self.astronauts))
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            
            .navigationBarItems(trailing: Button(action: {
                self.showingDate.toggle()
            }, label: {
                Text("Show \(self.showingDate ? "Date" : "Crew")")
            })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
