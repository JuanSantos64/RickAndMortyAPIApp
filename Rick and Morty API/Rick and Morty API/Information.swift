//
//  Information.swift
//  Rick and Morty API
//
//  Created by Student11 on 12/09/23.
//

import SwiftUI

struct Information: View {
    //var informacoes : String
    @StateObject var viewModel = SwiftUIView()
    var p : Name
    var body: some View {
        ZStack {
            AsyncImage(url: URL (string: "\(p.image!)")) { image in
            image.resizable()
                    .ignoresSafeArea()
                .frame(width: 800, height: 800)
                .shadow(radius: 15)
                .blur(radius: 10)
        } placeholder: {
            ProgressView()
        }
            VStack {
                AsyncImage(url: URL (string: "\(p.image!)")) { image in
                    image.resizable()
                        .frame(width: 150, height: 150)
                        .shadow(radius: 15)
                } placeholder: {
                    ProgressView()
                }
                Text("ID: \(p.id!)")
                Text("Name: " + p.name!)
                Text("Status: " + p.status!)
                Text("Species: " + p.species!)
                Text("Gender: " + p.gender!)
            }
        }
    }
}

//struct Information_Previews: PreviewProvider {
//    static var previews: some View {
//        Information(p: ")
//    }
//}
