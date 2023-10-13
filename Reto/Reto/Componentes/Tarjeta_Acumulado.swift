//
//  Tarjeta_Acumulado.swift
//  Reto
//
//  Created by Jimena Gallegos on 13/10/23.
//

import SwiftUI

struct Tarjeta_Acumulado: View {
    @Binding var id_repartidor: Int

    let totalCantidad = listaRecibos
        .filter { $0.estado == "Cobrado" && $0.repartidor_id == 1}
        .reduce(0) { (result, recibo) in
            return result + recibo.cantidad
        }
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 160, height: 90)
                    .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.96))
                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                
                VStack{
                    Text("Acumulado ")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.gray)
                    
                    Text("$\(totalCantidad, specifier: "%.2f")")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.03, green: 0.347, blue: 0.545))
                }
            }
        }
    }
}


struct Tarjeta_Acumulado_Previews: PreviewProvider {
    static var previews: some View {
        @State var variableTem: Int = 1
        Tarjeta_Acumulado(id_repartidor: .constant(variableTem))
    }
}
