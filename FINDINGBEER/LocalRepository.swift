//
//  LocalRepository.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 1/07/22.
//

import Foundation
class LocalRepository {
    func getLocales() -> [Local]{
        guard let data = loadJSONfile("Locales") else { fatalError("")} //desempaquetando data si es nulo me dará fatalError

         let decoder = JSONDecoder()

        guard  let response = try? decoder.decode([Local].self, from: data) else {
            fatalError("")
        
        }
        
        return response
    }
    
    func loadJSONfile(_ name: String) -> Data? { // Consigue la ruta de donde está el archivo de JSON {"} Locales.
          //Data
          guard let url =   Bundle.main.url(forResource: name, withExtension: "json") else { return nil }
          return try? Data(contentsOf: url)
      }
}
