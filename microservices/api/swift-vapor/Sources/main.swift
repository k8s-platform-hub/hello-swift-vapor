import Vapor
import HTTP
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
  let req = Request(method: .post, uri: dataUrl + "/v1/query")
  req.JSON = try JSON(node: [
        "type": "select",
        "args": try JSON(node: [
            "table": "article",
            "columns": try JSON(node: ["*"])
        ])
    ])

  let response = try drop.client.respond(to: req)
  return response
}

drop.run()
