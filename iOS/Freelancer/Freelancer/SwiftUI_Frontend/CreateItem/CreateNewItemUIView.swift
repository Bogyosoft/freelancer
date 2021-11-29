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
                TextField("Placeholder", text: $destination)
            }
            
            HStack
            {
                Text("Kiindulás: ")
                TextField("Placeholder", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            HStack
            {
                Text("Tulajdonságok: ")
                TextField("Placeholder", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            HStack
            {
                Text("Státusz: ")
                TextField("Placeholder", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            Button(action: {
                
                let sourceData = SourceData()
                let source = Source(inData: sourceData)
                //let handSource = SourceHandler()
                source.dataHandler.post(input: source, completion: {(valasz: Bool)->Void in
                    
                    print("SOURCE POST ON CREATENEWITEM: \(valasz)")
                    
                })
                
//                let item = Item()
//                let handItem = ItemDataHandler()
                
                
                
                /*print("SOURCE ASYNC")
                handSource.post(input: source)
                
                sleep(1)
                
                print("ITEM ASYNC - \(ResponseData.shared.szam)")
                handItem.post(input: item)*/
                
                //let lock = NSLock()
                /*let queueLock = DispatchQueue(label: "communicatorLock", attributes: .concurrent)

                queueLock.async{
                        lock.lock()
                        print("SOURCE ASYNC")
                        handSource.post(input: source)
                        lock.unlock()
                    }
                    
                queueLock.async{
                        lock.lock()
                        print("ITEM ASYNC - \(ResponseData.shared.szam)")
                    handItem.post(input: item)
                        lock.unlock()
                    }*/
                
                /*
                let globalQueue = DispatchQueue.global()
                let queue = DispatchQueue(label: "sellQueue", attributes: .concurrent)
                let semaphore = DispatchSemaphore(value: 0)
                //https://medium.com/cubo-ai/concurrency-thread-safety-in-swift-5281535f7d3a
                
                globalQueue.async {
                    queue.async{
                           
                            print("SOURCE ASYNC")
                            handSource.post(input: source)
                            semaphore.signal()
                            print(semaphore)
                    }
                    semaphore.wait()

                    queue.async{
                            print("ITEM ASYNC - \(ResponseData.shared.szam)")
                            handItem.post(input: item)
                            semaphore.signal()
                    }
                    semaphore.wait()
                    
                }*/
                
               
                
                /*let queue = DispatchQueue(label: "sellQueue", attributes: .concurrent)
                    
                    queue.async(flags: .barrier) {
                        print("SOURCE ASYNC")
                        handSource.post(input: source)
                    }
                
                queue.async(flags: .barrier) {
                    print("ITEM ASYNC - \(ResponseData.shared.szam)")
                    handItem.post(input: item)
                }*/
                
                
                
                
                
                
                
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
