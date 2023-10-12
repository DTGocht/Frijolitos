//
//  Recibos_Cobrados_Data.swift
//  reto_noEntregados
//
//  Created by Jimena Gallegos on 12/10/23.
//

import Foundation

var listaRecibos = getRecibos()

func getRecibos() -> Array<Recibos>{
    var lista: Array<Recibos> = [
        Recibos(id: 1, nombre: "Jimena", apellidos: "Gallegos", estado: "Cobrado"),
        Recibos(id: 2, nombre: "Manuel", apellidos: "Ortiz", estado: "Cobrado"),
        Recibos(id: 3, nombre: "Jaime", apellidos: "Cabrera", estado: "No Cobrado")
    ]
    
    // Carga datos, api, bd, etc
    
    return lista
}
