//
//  AstronautView.swift
//  project 8
//
//  Created by Anisha Lamichhane on 5/19/21.
//

import SwiftUI

struct AstronautView: View {
//    challenge 2
    init(astronaut: Astronaut) {
            self.astronaut = astronaut

            var matches = [Mission]()

            for mission in missions {
                if mission.crew.contains(where: { $0.name == astronaut.id }) {
                    matches.append(mission)
                }
            }
            self.missionsFlown = matches
        }
    
    let missionsFlown: [Mission]
    let astronaut : Astronaut
    var missions : [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    ForEach(self.missions){ mission in
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 83, height: 60)
                            Text(mission.displayName)
    
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
        static var previews: some View {
            AstronautView(astronaut: astronauts[0])
        }
}
