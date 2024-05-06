import UIKit

//simulate SDWebImage since it based on chain of responsibility when it attempts to load the image over the network unless cached on the memory



enum MessageState{
    case UnSent
    case Sent
    case Deleted
    case Edited
    
}

protocol Message{
    func changeMessageState (messageState:MessageState) -> Void
}

class MessageWithState : Message{
    
    private var messageState : MessageState
    
    required init(messageState:MessageState){
        self.messageState = messageState
    }
    
     func changeMessageState(messageState:MessageState) {
         switch self.messageState {
         case .UnSent:
             if messageState != .UnSent{
                 self.messageState = messageState
                 print("the message is \(String(describing: self.messageState))")

             }
             else {
                 print("the message is already UnSent")
             }
         case .Sent:
             if messageState != .Sent && messageState != .UnSent{
                 self.messageState = messageState
                 print("the message is \(String(describing: self.messageState))")

             }
             else {
                 print("the message is already sent")
             }
         case .Edited:
             if messageState == .Deleted{
                 self.messageState = .Deleted
                 print("the message is deleted")

             }
             else {
                 print("you cannot edit again nor send the message")
             }
         default:
             print("the message is already deleted")

                
         }
    }
    
    
}

class MessagesHandler : Message{
    var messages : [Message]
    init(messages:[Message]) {
        self.messages = messages
    }
    func changeMessageState(messageState: MessageState) {
        for message in messages{
            message.changeMessageState(messageState: messageState)
        }
    }
    
    
}

let message1 = MessageWithState(messageState: .Sent)
let message2 = MessageWithState(messageState: .Edited)
let message3 = MessageWithState(messageState: .UnSent)

let messageHandler = MessagesHandler(messages: [message1,message2,message3])
messageHandler.changeMessageState(messageState: .Sent)

