import SwiftyJSON

public extension PersistentRangeInitializedArray {
    
    init(json: JSON) {
        let array = json.arrayValue.map { Element(json: $0) }
        self.init(array: array)
    }
    
    func toJSON() -> JSON {
        let jarray: [JSON] = array.map { $0.toJSON() }
        return JSON(jarray)
    }
    
}
