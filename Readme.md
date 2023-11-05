
# 🔱 Rick and Morty API

Nesse projeto, desenvolvi um aplicativo para testar meus conhecimentos em APIs e o uso delas em códigos.

Esse projeto foi feito na linguagem Swift no Xcode

## 📖 API

[Essa foi a API utilizada para esse projeto](https://rickandmortyapi.com)

## Um pouco sobre o código

A identificação da API é a seguinte: 

```bash
struct Name : Decodable,Identifiable {
    let id : Int?
    let name :  String?
    let status :  String?
    let species :  String?
    let type :  String?
    let gender : String?
    let image : String?
    let url : String?
    let created : String?
}
struct Results: Decodable{
    let results : [Name]
}
```

Para pegar as informações da API, utilizei os seguintes códigos, feito a partir do [Artigo de Gabriel Thomaz sobre "Requisitando dados de uma API com SwiftUI"](https://medium.com/@gabrielthomaz/requisitando-dados-de-uma-api-com-swiftui-58431440b5eb)


Com o artigo acima, o código ficou desta maneira:

```bash
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
```



![Logo](https://cdn.vox-cdn.com/thumbor/9HfS_-ugBoHDaLskP6ssJ8_nIkY=/0x22:1584x851/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/24415978/rick_and_morty_s4_image.png)

# 😎 Obrigado por ter acompanhado essa documentação!
