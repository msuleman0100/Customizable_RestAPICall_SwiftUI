//
//  ContentView.swift
//  RestiCall
//
//  Created by Muhammad Suleman on 4/27/23.
//

import SwiftUI

struct JokesView: View {
    
    //Object of JokesVM() aka ViewModel
    @StateObject var viewModel = JokesVM()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                //showing loading  view when hitting api
                ProgressView()
            } else if !viewModel.errorMessage.isEmpty {
                // show error messafe if nay error occurs
                Text(viewModel.errorMessage)
            } else {
                //show jokes
                List(viewModel.jokes, id: \.id) { joke in
                    VStack(alignment: .leading) {
                        Text(joke.setup)
                            .font(.headline)
                        Text(joke.punchline)
                            .font(.subheadline)
                        Text(joke.type)
                            .font(.subheadline)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            //calling fetchJokes() method to fetch jokes
            viewModel.fetchJokes()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        JokesView()
    }
}
