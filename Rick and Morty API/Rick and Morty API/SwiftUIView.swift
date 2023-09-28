//
//  SwiftUIView.swift
//  Rick and Morty API
//
//  Created by Student11 on 12/09/23.
//
import Foundation

struct Name : Decodable,Identifiable {
    let id : Int?
    let name :  String?
    let status :  String?
    let species :  String?
    let type :  String?
    let gender : String?
  //  let origin : String?
  //  let location : String?
    let image : String?
  //  let episode : String?
    let url : String?
    let created : String?
}
struct Results: Decodable{
    let results : [Name]
}
class SwiftUIView : ObservableObject {
    @Published var chars : [Name] = []
    
    func fetch(){
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode(Results.self, from: data)
                
                DispatchQueue.main.async {
                    self?.chars = parsed.results
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}

