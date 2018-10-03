import UIKit

class EventPropertiesTableSection : SimplePropertiesTableSection {

  var eventProperties: [(String, String)]! = [(String, String)]()

  override func propertyKeyChanged(sender: UITextField!) {
    let arrayIndex = getCellRow(forTextField: sender) - self.propertyCellOffset
    eventProperties[arrayIndex].0 = sender.text!
  }

  override func propertyValueChanged(sender: UITextField!) {
    let arrayIndex = getCellRow(forTextField: sender) - self.propertyCellOffset
    eventProperties[arrayIndex].1 = sender.text!
  }

  override func propertyAtRow(row: Int) -> (String, String) {
    return eventProperties[row - self.propertyCellOffset]
  }

  override func getPropertyCount() -> Int {
    return eventProperties!.count
  }

  override func removeProperty(atRow row: Int) {
    eventProperties!.remove(at: row - self.propertyCellOffset)
  }

  override func addProperty(property: (String, String)) {
    eventProperties!.insert(property, at: 0)
  }

  func eventPropertiesDictionary() -> [String: String] {
    var propertyDictionary = [String: String]()
    for pair in eventProperties {
      propertyDictionary[pair.0] = pair.1
    }
    return propertyDictionary
  }
}

