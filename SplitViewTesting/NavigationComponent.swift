//
//  NavigationComponent.swift
//  SplitViewTesting
//
//  Created by Agus Hery on 18/10/22.
//

import SwiftUI

struct NavigationComponent: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Primary View")
                NavigationLink(
                    /// 2
                    destination: Text("Secondary View"),
                    /// 3
                    label: {
                        Text("Navigate")
                    })
            }
            
        }.navigationTitle("TEST")
        .navigationViewStyle(.stack)
    }
}

struct NavigationComponent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationComponent()
    }
}
