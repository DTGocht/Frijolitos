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
        Recibos(id: 1, nombre: "Jimena", apellidos: "Gallegos", estado: "Pendiente"),
        Recibos(id: 2, nombre: "Manuel", apellidos: "Ortiz", estado: "Pendiente"),
        Recibos(id: 3, nombre: "Jaime", apellidos: "Cabrera", estado: "Pendiente"),
        Recibos(id: 4, nombre: "Diego", apellidos: "Gocht", estado: "Pendiente"),
        Recibos(id: 5, nombre: "Kenyu", apellidos: "Medina", estado: "Pendiente"),
        Recibos(id: 6, nombre: "Andres", apellidos: "Gocht", estado: "Pendiente"),
        Recibos(id: 7, nombre: "Frederico", apellidos: "simon", estado: "Pendiente"),

    ]
    
    // Carga datos, api, bd, etc
    
    return lista
}
