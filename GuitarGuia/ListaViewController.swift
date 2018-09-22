//
//  ListaViewController.swift
//  GuitarGuia
//
//  Created by Caio Araujo Mariano on 17/09/2018.
//  Copyright © 2018 Caio Araujo Mariano. All rights reserved.
//

import UIKit

class ListaViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var buttonPlay: UIBarButtonItem!
    
    @IBOutlet weak var buttonPause: UIBarButtonItem!
    //MARK: Propriedades
    
    var segundos: [String] = []
    var horas : [String] = []
    var minutos : [String] = []
    
    var segundosAtuais = 0
    let opcoes = ["Hrs", "Mins", "Segs"]
    let qtdRows = [24, 60, 60]
    
    var temporizador = Timer()
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        
    }// Fechamento ViewDidLoad
    
    //MARK: Actions
    @IBAction func Iniciar(_ sender: UIBarButtonItem) {
        
        
        
        let horas = self.pickerView.selectedRow(inComponent: 0)
        let minutos = self.pickerView.selectedRow(inComponent: 1)
        let segundos = self.pickerView.selectedRow(inComponent: 2)
        
        segundosAtuais = segundos + minutos * 60 + horas * 3600
        
        self.buttonPlay.isEnabled = false
        self.buttonPause.isEnabled = true
        self.pickerView.isUserInteractionEnabled = false
        
        temporizador = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (meutimer) in
            
            if (self.segundosAtuais) == 0 {
                
                self.buttonPlay.isEnabled = true
                self.pickerView.isUserInteractionEnabled = true
                meutimer.invalidate()
                
            }
            
            self.segundosAtuais -= 1
            
            let rowSegundos = (self.segundosAtuais % 3600) % 60
            let rowMinutos = (self.segundosAtuais % 3600) / 60
            let rowHoras = (self.segundosAtuais / 3600)
            
            self.pickerView.selectRow(rowSegundos, inComponent: 2, animated: true)
            self.pickerView.selectRow(rowMinutos, inComponent: 1, animated: true)
            self.pickerView.selectRow(rowHoras, inComponent: 0, animated: true)
        }
        
    } // Fechamento Button iniciar
    
    @IBAction func reiniciar(_ sender: UIBarButtonItem) {
        
        segundosAtuais = 0
        
    } // Fechamento do Button Reiniciar
    
    @IBAction func pause(_ sender: UIBarButtonItem) {
        
        temporizador.invalidate()
        buttonPlay.isEnabled = true
        
    } // Fechamento Button Pause
    
    
    //MARK: Funcoes
    
    
}
extension ListaViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return qtdRows[component]
        
    }
    
    
} // Fechamento data Source

extension ListaViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(row) \(self.opcoes[component])"
    }
    
} // Fechamento Delegate









