//
//  ContentView.swift
//  RestiCall
//
//  Created by Muhammad Suleman on 4/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = JokesViewModel()
     
     var body: some View {
         NavigationView {
             Text("Hello")
//             List(viewModel.jokes ?? [], id: \.id) { joke in
//                 VStack(alignment: .leading) {
//                     Text(joke.setup)
//                         .font(.headline)
//                     Text(joke.punchline)
//                         .font(.subheadline)
//                         .foregroundColor(.secondary)
//                 }
//             }
             .navigationTitle("Jokes")
             .onAppear {
                 viewModel.fetchJokes()
             }
         }
     }
 }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


