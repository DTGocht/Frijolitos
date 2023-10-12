//
//  Recibos_Cobrados_Row_View.swift
//  reto_noEntregados
//
//  Created by Jimena Gallegos on 12/10/23.
//

import SwiftUI

struct Recibos_Cobrados_Row_View: View{
    @State var recibo: Recibos
    var body: some View {
        VStack{
            ZStack{
                if (recibo.estado == "Cobrado"){
                    Tarjeta_Nombre_Verde()
                }
                else if(recibo.estado == "Pendiente"){
                    Tarjeta_Nombre_Amarilla()
                }
                
                else if (recibo.estado == "No Cobrado"){
                    Tarjeta_Nombre_Roja()
                }
                VStack{
                    Text("\(recibo.nombre) \(recibo.apellidos) ")
                        .font(.title2)
                        .bold()
                        .frame(width: 310, height: 28, alignment: .leading)
                    
                    Text("\(recibo.estado)")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.gray)
                        .frame(width: 250, alignment: .leading)
                }
            }
        }
    }
}

struct Recibos_Cobrados_Row_View_Previews: PreviewProvider {
    static var previews: some View {
        var rec1: Recibos = listaRecibos[0]
        Recibos_Cobrados_Row_View( recibo: rec1)
    }
}
