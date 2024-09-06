//
//  LocomotiveDetailView.swift
//  EngineYard
//
//  Created by Amarjit on 06/09/2024.
//

import SwiftUI

struct LocomotiveDetailView: View {
    let locomotive: DummyLocomotive?
    
    private var dummyLocomotive: DummyLocomotive {
        DummyLocomotive(name: "4-6-2", price: 12, power: 6)
    }
    
    private var displayedLocomotive: DummyLocomotive {
        locomotive ?? dummyLocomotive
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(displayedLocomotive.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack {
                VStack(alignment: .leading) {
                    DetailRow(title: "Price", value: "$\(displayedLocomotive.price)")
                    DetailRow(title: "Power", value: "\(displayedLocomotive.power)")
                }
                Spacer()
            }
            
            Text("Description")
                .font(.headline)
            Text("This is a \(displayedLocomotive.name) locomotive. It has a power rating of \(displayedLocomotive.power) and costs $\(displayedLocomotive.price).")
                .font(.body)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Locomotive Details")
    }
}

struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.subheadline)
        }
    }
}

#Preview {
    NavigationView {
        LocomotiveDetailView(locomotive: nil)
    }
}
