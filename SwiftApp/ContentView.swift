//
//  ContentView.swift
//  SwiftApp
//
//  Created by ptw on 28/12/22.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        NavigationView {
//                 VStack {
//                    Text("Navigation Link below:")
//                    NavigationLink(destination: SecondView()) {
//                       Text("Navigate here.")
//                    }
//                 }
//              }
//    }
//}
//
//struct SecondView: View {
//   var body: some View {
//      Text("Now on the second view.")
//   }
//}
struct DataType: Identifiable {
  let id    : Int
  let name  : String
  let size  : String
  let color : Color
}

var dataTypeList = [
    DataType(id: 0,name: "Integer", size: "4 bytes", color: .red),
    DataType(id: 1,name: "Integer", size: "1 byte", color: .blue),
    DataType(id: 2,name: "Float", size: "4 bytes", color: .green),
    DataType(id: 3,name: "Double", size: "8 bytes", color: .yellow),
  ]

struct Country{
    var isoCode:String,
     name:String
}

let countries = [
    Country(isoCode: "at", name: "Austria"),
    Country(isoCode: "be", name: "Belgium"),
    Country(isoCode: "de", name: "Germany"),
    Country(isoCode: "el", name: "Greece"),
    Country(isoCode: "fr", name: "France"),
]



struct FavouritesView: View {
   var body: some View {
      Text("This is favourite view.")
   }
}

struct ProductListView: View {
    var body: some View {
       Text("This is product view view.")
    }
}

struct SomeView: View {
   var body: some View {
      NavigationView {
         VStack {
            Text("Product details")
             
            NavigationLink(destination: ProductListView()) {
               Text("Product list page.")
            }
             
             NavigationLink(destination: FavouritesView()) {
                Text("Favourite page.")
             }
             
         }
      }
   }
}

//-----------------------------------------------------

struct ProductList {
    var products:[Array<Any>]
}

private var products: [ProductList]?
private var domainUrlString = "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328"

func fetchFilms(completionHandler: @escaping ([ProductList]) -> Void) {
    let url = URL(string: domainUrlString)!

    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
        print("Error with fetching films: \(error)")
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: ",(response) ?? <#default value#>)
        return
      }

      if let data = data,
        let filmSummary = try? JSONDecoder().decode(FilmSummary.self, from: data) {
        completionHandler(filmSummary.results ?? [])
      }
    })
    task.resume()
  }


//function calling
fetchFilms { [weak self] (films) in
      self?.films = films
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
   











struct ProductListView: View {
    
    
    
//   var body: some View {
//       List(dataTypeList) { dataType in
//                 HStack {
//                   Text(dataType.name)
//                   Text(dataType.size).foregroundColor(dataType.color)
//                 }
//           Button("Button ") {
//               //this happens when it's tapped
//           }
//               }
//
//   }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SomeView()
    }
}
}
