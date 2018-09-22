//
//  Globais.swift
//  GuitarGuia
//
//  Created by Caio Araujo Mariano on 20/09/2018.
//  Copyright © 2018 Caio Araujo Mariano. All rights reserved.
//

import UIKit
import CoreData

let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

// Objetos de acesso rapido aos nomes da tebela e campos
let tabela = "CoreDataCadastro"
let campoExercicio = "exercicio"
let campoTempo = "tempo"
let campoObservacoes = "observacoes"

// Propriedade para indicar qual o registro sera editado
var indiceEdicao = Int()

// Array de registros extraidos do banco
var arrayDados : [NSManagedObject] = []
