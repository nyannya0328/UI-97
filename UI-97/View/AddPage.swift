//
//  AddPage.swift
//  UI-97
//
//  Created by にゃんにゃん丸 on 2021/01/06.
//

import SwiftUI

struct AddPage: View {
    @EnvironmentObject var model : DBViewModel
    @Environment(\.presentationMode) var presentation
    var body: some View {
        NavigationView{
            
            List{
                
                Section(header: Text("Title")){TextField("", text: $model.title)}
                
                Section(header: Text("Detail")){TextField("", text: $model.detail)}
                
                
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(model.updateobject == nil ? "AddData" : "Updata", displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Cancel")
                    })
                    
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button(action:
                            {model.Adddata(presentation: presentation)}
                        
                        , label: {
                        
                        Text("Done")
                    })
                    
                    
                }
            })
            
        }
        .onAppear(perform: {
            model.setupInitialData()
        })
        .onDisappear(perform: {
            model.deInitData()
        })
    }
}

