//
//  CadastroViewController.swift
//  GuitarGuia
//
//  Created by Caio Araujo Mariano on 18/09/2018.
//  Copyright © 2018 Caio Araujo Mariano. All rights reserved.
//

import UIKit
import CoreData



class CadastroViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var textFieldExercicio: UITextField!
    @IBOutlet weak var textFieldTempo: UITextField!
    @IBOutlet weak var textFieldObservacao: UITextField!
    @IBOutlet weak var buttonCadastrar: UIButton!
    
    
    //MARK: Propriedades
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buttonCadastrar.layer.cornerRadius = 15
    }
    
    //MARK: Actions
    
    @IBAction func cadastrar(_ sender: UIButton) {
        
        if !(textFieldTempo.text!.isEmpty || textFieldExercicio.text!.isEmpty){
            
           let descricaoEntidade = NSEntityDescription.entity(forEntityName: tabela, in: contexto)
            
            //novo registro
            let novoExercicio = NSManagedObject(entity: descricaoEntidade!, insertInto: contexto)
            
            novoExercicio.setValue(textFieldExercicio.text!, forKey: campoExercicio)
            novoExercicio.setValue(textFieldTempo.text!, forKey: campoTempo)
            novoExercicio.setValue(textFieldObservacao.text!, forKey: campoObservacoes)
            
            do {
                
                try contexto.save()
                print("Cadastro efetuado com sucesso")
                textFieldObservacao.text = ""
                textFieldTempo.text = ""
                textFieldExercicio.text = ""
                
                let alerta = UIAlertController(title: "Parabens", message: "Cadastro concluido", preferredStyle: .alert)
                
                let botaoOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alerta.addAction(botaoOk)
                
                present(alerta, animated: true, completion: nil)
                
            } catch {
                
                print("Erro ao cadastrar")
                print(error.localizedDescription)
                
            }
        
        } else {
            
            let alerta = UIAlertController(title: "Alerta", message: "Preencha os campos corretamente", preferredStyle: .alert)
            
            let botaoOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alerta.addAction(botaoOk)
            
            present(alerta, animated: true, completion: nil)
            
        }
    }
    
    
    // MARK: - Metodos UIResponder
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }
    
    
    
}
