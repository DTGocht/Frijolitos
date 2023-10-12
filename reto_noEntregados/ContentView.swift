//
//  ContentView.swift
//  reto_noEntregados
//
//  Created by Jimena Gallegos on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
            List(listaRecibos){
                x in Recibos_Cobrados_Row_View(recibo: x)
            }
            .listStyle(.inset)


            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
