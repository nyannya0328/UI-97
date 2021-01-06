//
//  DBViewModel.swift
//  UI-97
//
//  Created by にゃんにゃん丸 on 2021/01/06.
//

import SwiftUI
import RealmSwift

class DBViewModel: ObservableObject {
   @Published var title = ""
   @Published var detail = ""
    
    
   
    @Published var opennewpage = false
    
    @Published var cards : [Card] =  []
    
    @Published var updateobject :  Card?
    
    init() {
        fetchdata()
    }
    
    
   
    
    
    func fetchdata(){
        
        guard let dbRef = try? Realm() else{return}
        
        let results = dbRef.objects(Card.self)
        self.cards = results.compactMap({ (card) -> Card? in
            return card
        })
    
    }
    
    
    func Adddata(presentation : Binding<PresentationMode>){
        
        let card = Card()
        card.title = title
        card.detail = detail
        
        
        guard let dbRef = try? Realm() else{return}
        
        try? dbRef.write{
            guard let availableObject = updateobject else{
                
                dbRef.add(card)
                return
                
            }
            availableObject.title = title
            availableObject.detail = detail
            
            
          
            
        }
        presentation.wrappedValue.dismiss()
        fetchdata()
        
    }
    
    func deleteData(object:Card){
        
        guard let dbRef = try? Realm() else{return}
        
        try? dbRef.write{
            
            dbRef.delete(object)
            fetchdata()
            
        }
        
        
    }
    
    func setupInitialData(){
        
        guard let updatedata = updateobject else {return}
        
        title = updatedata.title
        detail = updatedata.detail
        
        
    }
    

    
    
    func deInitData(){
        
        updateobject = nil
        
        title = ""
        detail = ""
        
        
        
    }
    
    
    
}

