//
//  CreateNewItemUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 09..
//

import SwiftUI

struct CreateNewItemUIView: View {
    
    @State var destination: String = ""
    
    var body: some View {
        VStack
        {
            Text("Új küldemény feladása")
            HStack
            {
                Text("Cél: ")
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $destination)
            }
            
            HStack
            {
                Text("Kiindulás: ")
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            HStack
            {
                Text("Tulajdonságok: ")
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            HStack
            {
                Text("Státusz: ")
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            Button(action: {
                
                let item = Item()
                let hand = ItemDataHandler()
                let source = Source()
                let handSource = SourceHandler()
                
                let globalQueue = DispatchQueue.global()
                    let queue = DispatchQueue(label: "sellQueue", attributes: .concurrent)
                    let semaphore = DispatchSemaphore(value: 0)
                    //https://medium.com/cubo-ai/concurrency-thread-safety-in-swift-5281535f7d3a
                    globalQueue.async {
                        queue.async{
                           
                            print("SOURCE ASYNC")
                            handSource.create(input: source)
                            semaphore.signal()
                        }
                        semaphore.wait()

                        queue.async{
                            print("ITEM ASYNC - \(ResponseData.shared.szam)")
                            hand.createItem(inputItem: item)
                            semaphore.signal()
                        }
                        semaphore.wait()
                    }
                
                /*let queue = DispatchQueue(label: "sellQueue", attributes: .concurrent)
                    
                queue.sync(flags: .barrier) {
                    print("SOURCE ASYNC")
                    handSource.create(input: source)
                
                }
                //sleep(1)
                queue.sync(flags: .barrier) {
                    print("ITEM ASYNC")
                    hand.createItem(inputItem: item)
                }*/
                
                
                
                // read
                /*Flag.shared.queue.sync {
                    // perform read and assign value
                    print("FLAG OLVASAS: \(Flag.shared.canGoOn)")
                    if Flag.shared.canGoOn
                    {
                        
                    }
                }*/
                
                
                
                
                
            }) {
                Text("Küldemény feladása")
            }
            
            
            
            
        }
        
    }
}

struct CreateNewItemUIView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewItemUIView()
    }
}
