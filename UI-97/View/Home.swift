//
//  Home.swift
//  UI-97
//
//  Created by にゃんにゃん丸 on 2021/01/06.
//

import SwiftUI

struct Home: View {
    @StateObject var model = DBViewModel()
    var body: some View {
        NavigationView{
            
            ScrollView{
                
                VStack(spacing:20){
                    
                    ForEach(model.cards){card in
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            Text(card.title)
                            Text(card.detail)
                                .font(.caption)
                                .foregroundColor(.gray)
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(10)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(10)
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .contextMenu(ContextMenu{
                            
                
                            Button(action: {
                                
                                model.deleteData(object: card)
                            }, label: {
                                Text("Delete")
                            })
                            
                            Button(action: {
                                model.updateobject = card
                                model.opennewpage.toggle()
                                
                            }, label: {
                                
                                Text("Update")
                               
                            })
                        
                          
                        })
                        
                        
                    }
                    
                }
                .padding()
                
                
            }
            
            .navigationTitle("Realm DB")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button(action: {model.opennewpage.toggle()}, label: {
                        Image(systemName: "plus")
                    })
                    
                }
            })
            .fullScreenCover(isPresented: $model.opennewpage, content: {
                
                AddPage()
                    .environmentObject(model)
                
            })
        }
    }
}


