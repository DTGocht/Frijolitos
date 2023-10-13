//
//  Recibos_Data.swift
//  Reto
//
//  Created by Jimena Gallegos on 13/10/23.
//

import Foundation

var listaRecibos = getRecibos()

func getRecibos() -> Array<Recibos>{
    var lista: Array<Recibos> = [
        Recibos(id: 1, nombre: "Jimena", apellidos: "Gallegos", estado: "Pendiente", cantidad: 500, repartidor_id: 1),
        Recibos(id: 2, nombre: "Manuel", apellidos: "Ortiz", estado: "Pendiente", cantidad: 150, repartidor_id: 1),
        Recibos(id: 3, nombre: "Jose", apellidos: "Rongel", estado: "No Cobrado", cantidad: 250.5, repartidor_id: 1),
        Recibos(id: 4, nombre: "Luisa", apellidos: "Perez", estado: "Cobrado", cantidad: 250.5, repartidor_id: 1),
        Recibos(id: 5, nombre: "Panchito", apellidos: "Gonzales", estado: "Cobrado", cantidad: 250.5, repartidor_id: 1),
        Recibos(id: 6, nombre: "Pablo", apellidos: "Fong", estado: "Cobrado", cantidad: 400, repartidor_id: 2),
        Recibos(id: 7, nombre: "Diego", apellidos: "Gotch", estado: "Cobrado", cantidad: 300, repartidor_id: 2)
    ]
    
    // Carga datos, api, bd, etc
    
    return lista
}
