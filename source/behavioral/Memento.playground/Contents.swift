import Foundation

/*:
💾 Memento
----------

The memento pattern is used to capture the current state of an object and store it in such a manner that it can be restored at a later time without breaking the rules of encapsulation.

### Example
*/
protocol MementoData{
    var text : String {get set}
}

// orginator - create and restore From Memento (Snapshot)

class Editor : MementoData{
    var text : String = ""
    
    init(text:String){
        self.text = text
    }
    
    func createMemento()-> EditorMemento{
        return EditorMemento(text: self.text)
    }
    func restoreFromMemento(editorMemento:EditorMemento){
        self.text = editorMemento.text
    }
}
//Memento (SnapShot)
struct EditorMemento : MementoData{
    var text : String
}

// Care taker
class History{
    var mementos:[EditorMemento] = []
    func saveMemento(editorMemento:EditorMemento)->Void{
        self.mementos.append(editorMemento)
    }
    func restoreLastMemento(editor:Editor)->Void{
        guard let lastMemento = self.mementos.popLast() else{
            return
        }
        editor.restoreFromMemento(editorMemento: lastMemento)
    }
}


 //Orginator
 let editor = Editor(text: "hello there")

// CareTaker
 let history = History()
history.saveMemento(editorMemento: editor.createMemento())

//make unWantedChanges
editor.text = "Hllo Trhee"

history.restoreLastMemento(editor:editor)

 print(editor.text)

