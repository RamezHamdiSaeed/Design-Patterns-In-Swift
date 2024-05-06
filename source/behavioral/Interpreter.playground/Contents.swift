
import Foundation

// interpreter design pattern used to interprete language (English, Music, equation,..) to other format with combined terminal and non - terminal operators

// i.e. we want to implement Reverse Polish Notation or postfix operation based equations like 2 + 3 * 4
// which equals 2 3 + 4 * == 20

//we have terminal expressions which are the numbers (operands) and non - terminal expressions which are the operators


protocol Expression{
    func interprete() -> Double
}

class NumberExpression : Expression{
    
    var numberValue : Double
    
    init(value numberValue:Double) {
        self.numberValue = numberValue
    }
    func interprete() -> Double{
        return self.numberValue
    }
    
}

class AddExpression : Expression{
    
    var left : Expression
    var right : Expression
    
    init(left leftExpression:Expression,right rightExpression:Expression) {
        self.left = leftExpression
        self.right = rightExpression
    }
    func interprete() -> Double {
        return left.interprete() + right.interprete()
    }
    
    
}

class MultiplyExpression : Expression{
    
    var left : Expression
    var right : Expression
    
    init(left leftExpression:Expression,right rightExpression:Expression) {
        self.left = leftExpression
        self.right = rightExpression
    }
    func interprete() -> Double {
        return left.interprete() * right.interprete()
    }
    
    
}

class DivExpression : Expression{
    
    var left : Expression
    var right : Expression
    
    init(left leftExpression:Expression,right rightExpression:Expression) {
        self.left = leftExpression
        self.right = rightExpression
    }
    func interprete() -> Double {
        return left.interprete() / right.interprete()
    }
    
    
}

 let two:NumberExpression = NumberExpression(value: 2)
 let three:NumberExpression = NumberExpression(value: 3)
 let four:NumberExpression = NumberExpression(value: 4)

 let completeExpression : Expression = MultiplyExpression(left: AddExpression(left: two,right: three) ,right: four)
 let result = completeExpression.interprete()
