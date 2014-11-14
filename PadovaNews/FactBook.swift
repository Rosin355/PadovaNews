//
//  FactBook.swift
//  PadovaNews
//
//  Created by Romesh Singhabahu on 14/10/14.
//  Copyright (c) 2014 Romesh Singhabahu. All rights reserved.
//

import Foundation


struct FactBook {
    
    let factsArray = [
        "Caval,putana e persegar,trent'anni no i pol durar.",
        "Chi se tol per amor, per rabia se lassa.",
        "Ciaro te vedo e spesso me ricordo: moroso da lontan no val un corno.",
        "Le campane no sona se qualchedun no le tira.",
        "I preti fa boger la pignata co le giame del purgatorio.",
        "L'amor no l'è amor, se no'l se desgusta sete volte.",
        "Parla quando pissa le galline.",
        "Quando el galo canta zo de ora, doman no xe più'l tempo de sta ora.",
        "L'acqua de mare la lava tutti i debiti.",
        "Nè re nè disnar, se fa mai asptar.",
        "Una coa de pitona no ga na oena sola.",
        "I fati i è omeni, e le ciacole i è done.",
        "Taglia la coa al can, el resta can.",
        "Co la vaca tien su'l muso, bruto tempo salta suso.",
        "Co se g'ha fame, tuto sa da bon.",
        "Co se xe morti, San Michele pesa le anime, e i preti i candelotti.",
        "Comare e preti comporta pensieri.",
        "Corpi pien, anema consolà." 
        
    ]
    
    func randomFact() -> String {
        var unsignedArrayCount = UInt32(factsArray.count)
        var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        var randomNumber = Int(unsignedRandomNumber)
        
        return factsArray[randomNumber]
    }




}