public enum ValidationState {
    case valid, invalid
}

public protocol InputValidator {
    var validationState: ValidationState { get }
}
