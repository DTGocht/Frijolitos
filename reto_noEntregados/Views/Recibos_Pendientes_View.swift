//
//  Recibos_Pendientes_View.swift
//  reto_noEntregados
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI

struct Recibos_Pendientes_View: View {
    var body: some View {
        VStack{
            Image("CaritasBlue")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .padding(-50)
            HStack{
                Text("Pendientes")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal, 10)
                Spacer()
            }
            List(listaRecibos){
                x in Recibos_Cobrados_Row_View(recibo: x)
            }
            .listStyle(.inset)


            Spacer()
        }
        .padding()
        //Cambia el background
        //.background(Color("PantoneGC"))
    }
}

struct Recibos_Pendientes_View_Previews: PreviewProvider {
    static var previews: some View {
        Recibos_Pendientes_View()
    }
}
