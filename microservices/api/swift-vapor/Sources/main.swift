import Vapor
import Foundation

var dataUrl = "http://data.default"
if let value = ProcessInfo.processInfo.environment["environment"] {
  if value == "dev" {
    dataUrl = "http://127.0.0.1:6432"
  }
}

let drop = Droplet()

drop.get("/") { _ in
  return "Hello World"
}

drop.get("/get_articles") { _ in
  return dataUrl
}

drop.run()
