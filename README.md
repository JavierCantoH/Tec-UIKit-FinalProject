# Tec-UIKit-FinalProject 🚀

Welcome to the Tec-UIKit-FinalProject repository! This repository contains the final project for the iOS Development with Swift course at Tecnológico de Monterrey. 📱💻🎓

## Overview 📝

The Tec-UIKit-FinalProject is a comprehensive iOS app that allows users to create and share custom travel itineraries. The app includes a variety of features to help users plan their trips, including the ability to search for and book flights, hotels, and activities. Users can also save their itineraries and share them with others. 🗺️🏨🛫

The project includes the following features:

- A modern and user-friendly interface that is easy to use and navigate 📱👀
- Integration with popular travel APIs, including Amadeus, TripAdvisor, and Airbnb 🛫🏨🗺️
- The ability to search for and book flights, hotels, and activities ✈️🏨🎉
- A personalized dashboard that displays the user's saved itineraries and recent searches 📈🔍
- Social sharing features that allow users to share their itineraries with others 📤👥

## Getting Started 🚀

To get started with the Tec-UIKit-FinalProject, simply clone this repository and open the Xcode project file. You can then build and run the app in the iOS Simulator or on a physical iOS device. 🛠️📱

## Usage 🤖

To use the Tec-UIKit-FinalProject in your own iOS app, simply copy the necessary files and APIs to your project and modify the code to fit your needs. The project is designed to be modular and customizable, so you can easily add or remove features as needed. 📝🎨

```swift
import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var searchField: UITextField!
  @IBOutlet weak var resultsTableView: UITableView!

  var searchResults = [SearchResult]()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Set up the search field
    searchField.delegate = self
    // Set up the results table view
    resultsTableView.delegate = self
    resultsTableView.dataSource = self
  }

  func search(for query: String) {
    // Perform the search
    let searchClient = SearchClient()
    searchClient.search(for: query) { (results, error) in
      if let error = error {
        print("Error searching: \(error.localizedDescription)")
      } else if let results = results {
        self.searchResults = results
        self.resultsTableView.reloadData()
      }
    }
  }

}

extension ViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // Handle the return key
    if let query = textField.text {
      search(for: query)
    }
    return true
  }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // Return the number of rows
    return searchResults.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Configure the cell
    let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as! SearchResultCell
    cell.configure(with: searchResults[indexPath.row])
    return cell
  }

}
```

Credits 🙌

The Tec-UIKit-FinalProject was created by Javier Canto as the final project for the Mobile Development class @ Tecnológico de Monterrey Campus Puebla.
