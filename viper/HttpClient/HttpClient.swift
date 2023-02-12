//
//  HttpClient.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import Foundation
// <Element: Codable> -> Indica que la clase HttpClient es genérica y que el tipo de dato que recibe es un elemento que se conforme a la protocolo Codable
class HttpClient<Element: Codable> {
    // @escaping: indica que el closure se ejecutará fuera del ámbito de la función en la que se ha definido.
    func get(url: String, completion: @escaping (Element) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = self.validaDatosRecibidos(error: error, response: response, data: data) else { return }
            do {
                let resultado = try JSONDecoder().decode(Element.self, from: data)
                completion(resultado)
            } catch let error {
                print("Error al parsear JSON:", error)
            }
        }.resume()
    }

    func validaDatosRecibidos(error: Error?, response: URLResponse?, data: Data?) -> Data? { // Comprobamos si hay datos
        if error != nil {
            print("Error al realizar la petición")
            print(error!.localizedDescription) // localized hace referencia al idioma.ç
            return nil
        }
        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 { // 200 es el código de respuesta correcto.
            print("El Status Code es: \(httpStatus.statusCode)")  // httpStatus.statusCode: Es el código de respuesta.
            print("Responde:", response!) // Imprimimos la respuesta del servidor.
            return nil
        }
        guard let data = data else {
            return nil
        }
        return data
    }
}

