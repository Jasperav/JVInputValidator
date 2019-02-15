public enum ValidationState {
    case valid, invalid
}

public struct InputValidator: InputValidateable {
    public private (set) var validationState: ValidationState
    public var changedValidationState: ((ValidationState) -> ())!
    
    public init(validationState: ValidationState) {
        self.validationState = validationState
    }
    
    public mutating func update(isValid: Bool) {
        if isValid {
            validationState = .valid
        } else {
            validationState = .invalid
        }
        
        changedValidationState(validationState)
    }
}

public protocol InputValidateable {
    var validationState: ValidationState { get }
    var changedValidationState: ((ValidationState) -> ())! { get }
}
