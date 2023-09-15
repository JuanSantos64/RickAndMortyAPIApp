//
//  ContentView.swift
//  Rick and Morty API
//
//  Created by Student11 on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = SwiftUIView()
    
    var body: some View {
        
        NavigationStack {
            Text("Rick and Morty")
                .font(.largeTitle)
                .bold()
            List {
                VStack {
                    ScrollView{
                        ForEach(viewModel.chars, id: \.id){ index in
                            NavigationLink(destination: Information(p: index)){
                                HStack {
                                    
                                    AsyncImage(url: URL (string: "\(index.image!)")) { image in
                                        image.resizable()
                                            .frame(width: 150, height: 150)
                                            .shadow(radius: 15)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Spacer()
                                    Text(index.name!)
                                        .padding()
                                }
                            }
                            
                        }
                    }
                }
            }.onAppear(){
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
