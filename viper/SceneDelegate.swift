//
//  SceneDelegate.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }

        let router = ListOfMoviesRouter() // Comenzar ejecutando la clase ListOfMoviesRouter
        let window = UIWindow(frame: UIScreen.main.bounds) // Creamos la instancia de la ventana desde aquí
        window.windowScene = scene as? UIWindowScene
        self.window = window
        router.showListOfMovies(window: self.window) // Inicializamos el router
    }
}

