//
//  Recibos_Cobrados_View.swift
//  Reto
//
//  Created by Jimena Gallegos on 13/10/23.
//

import SwiftUI

struct Recibos_Cobrados_View: View {
    
    @State var listaRecibos = getRecibos()
    @State var listaRepartidores = getRepartidores()
    @State var id = 1
    
    var body: some View {
        NavigationStack{
            Header()
            VStack{
                Text("Cobrados")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(width: 350, alignment: .leading)
                List {
                    ForEach(listaRecibos.filter{$0.estado == "Cobrado" && $0.repartidor_id == id}) { recibo in
                        Recibos_Lista(recibo: recibo)
                    }
                }
                .listStyle(.inset)
                HStack{
                    Tarjeta_Acumulado(id_repartidor: $id)
                    Tarjeta_Status(repatidor: listaRepartidores[id-1])
                }
                
                Spacer()
            } .padding()
            }
            
    }
    
    func moveRecibo(from source: IndexSet, to destination: Int) {
            listaRecibos.move(fromOffsets: source, toOffset: destination)
        }
}

struct Recibos_Cobrados_View_Previews: PreviewProvider {
    static var previews: some View {
        Recibos_Cobrados_View()
    }
}
