//
//  LocomotiveListView.swift
//  EngineYard
//
//  Created by Amarjit on 06/09/2024.
//

import SwiftUI

struct DummyLocomotive: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
    let power: Int
}

struct LocomotiveListView: View {
    let locomotives = [
        DummyLocomotive(name: "0-4-0", price: 4, power: 2),
        DummyLocomotive(name: "2-6-0", price: 6, power: 3),
        DummyLocomotive(name: "4-4-0", price: 7, power: 4),
        DummyLocomotive(name: "2-6-2", price: 8, power: 4),
        DummyLocomotive(name: "2-8-0", price: 9, power: 5),
        DummyLocomotive(name: "4-6-0", price: 10, power: 5),
        DummyLocomotive(name: "2-8-2", price: 11, power: 6),
        DummyLocomotive(name: "4-6-2", price: 12, power: 6),
        DummyLocomotive(name: "2-10-0", price: 13, power: 7),
        DummyLocomotive(name: "4-8-0", price: 14, power: 7),
        DummyLocomotive(name: "2-10-2", price: 15, power: 8),
        DummyLocomotive(name: "4-8-2", price: 16, power: 8),
        DummyLocomotive(name: "4-8-4", price: 17, power: 9),
        DummyLocomotive(name: "4-10-2", price: 18, power: 10)
    ].sorted(by: { $0.price < $1.price })

    var body: some View {
        List(locomotives) { locomotive in
            NavigationLink(destination: LocomotiveDetailView(locomotive: locomotive)) {
                HStack {
                    Text(locomotive.name)
                        .font(.headline)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Price: $\(locomotive.price)")
                            .font(.subheadline)
                        Text("Power: \(locomotive.power)")
                            .font(.subheadline)
                    }
                }
            }
        }
        .navigationTitle("Locomotives")
    }
}

struct LocomotiveListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocomotiveListView()
        }
    }
}
