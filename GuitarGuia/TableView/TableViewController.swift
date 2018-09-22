//
//  TableViewController.swift
//  GuitarGuia
//
//  Created by Caio Araujo Mariano on 17/09/2018.
//  Copyright © 2018 Caio Araujo Mariano. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
        

    override func viewDidAppear(_ animated: Bool) {
    
    
        
        // Resgatando os dados do banco
        let pesquisa = NSFetchRequest<NSFetchRequestResult>(entityName: tabela)
        
        // Trazendo os dados da pesquisa para dentro do array
        do {
            
            arrayDados = try contexto.fetch(pesquisa) as! [NSManagedObject]
            
            // Atualizando a tabela
            tableView.reloadData()
            
        } catch {
            
            print("Erro na pesquisa")
            print(error.localizedDescription)
    
    }

    }

    
          // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayDados.count
        
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! MinhaTableViewCell

        cell.labelExercicio.text = "Exercicio: \(arrayDados[indexPath.row].value(forKey: campoExercicio)!)"
        cell.labelTempo.text = "Tempo: \(arrayDados[indexPath.row].value(forKey: campoTempo)!) "
        
        return cell
  
    }
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            contexto.delete(arrayDados[indexPath.row])
            
            do {
                
                try contexto.save()
                arrayDados.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            } catch {
                
                print("Erro ao apagar registro")
                print(error.localizedDescription)
                
            }
            
            
        }
   
    }
}
