//
//  SceneDelegate.swift
//  IndividualChallenge
//
//  Created by Narely Lima on 11/10/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    // DEFINIR A TELA INICIAL PROGRAMATICAMENTE
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
        // usado para especificar uma acao executada por ios 15 e atualizacoes a cima
        if #available(iOS 15, *) {
            // personalizacao do meu navegador, no caso para que a visualizacao seja
            // scrollado caso o usuario chegue no limite da visualizacao
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
        }
        // instancia a primeira interface do usuario
        guard let windowScene = (scene as? UIWindowScene) else {return}
        let window = UIWindow(windowScene: windowScene)
        // apresentar minha primeira view
        let animeViewController = AnimeViewController()
        // definir que a 'raiz do aplicativo' será um objeto instaciado pela classe UIWindowScene será
        // a minha classe animeViewController
        window.rootViewController = animeViewController
        self.window = window
        // cria uma chave de janela para permitir a sobreposicao dessa janela
        // sob quaisquer outras
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded
        // (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
