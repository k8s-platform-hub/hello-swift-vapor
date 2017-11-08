import Vapor

let drop = Droplet()

drop.get("/") { _ in
  return "Hello World"
}

drop.run()
