## What does this come with?

[**Vapor**](https://vapor.codes/) is a Web Framework for Swift that works on iOS, macOS, and Ubuntu.

* **Dockerfile** (automatically used by Hasura for deployment)

```bash
FROM swift:3.1.0

WORKDIR /swift-vapor
ADD swift-vapor /swift-vapor
RUN swift build 

CMD .build/debug/swift-vapor
``` 
## Deployment instructions

### Basic deployment:

* Press the **Clone & Deploy** button and follow the instructions.
* The `hasura quickstart` command clones the project repository to your local computer, and also creates a **free Hasura cluster**, where the project will be hosted.
* A git remote (called hasura) is created and initialized with your project directory.
* Run `git add .`, `git commit`, and `git push hasura master`.
* Run the below command to open your shiny new deployed reason app.
``` shell
$ hasura microservice open api
```
### Making changes and deploying

* To make changes to the project, browse to `/microservices/api/swift-vapor` and edit the files according to your app.
* Commit the changes, and perform `git push hasura master` to deploy the changes.

### Deployment - behind the scenes:

![Deployment](https://raw.githubusercontent.com/anirudhmurali/ReasonReact-Todo/master/deploy.gif)

## Local development

To test and make changes to this app locally, follow the below instructions.
* Open Terminal and `cd` into the project folder.
* Run `swift build` to build the app.
* Run `.build/debug/swift-vapor` to run it.
* Make changes to the app, and see the changes in the browser

## View server logs

You can view the logs for your app by running the below command:

``` shell
$ hasura microservice logs api
```
You can see the logs in your terminal, press `CTRL + C` to stop logging.

## Managing app dependencies

* System dependencies, like changing the web-server can be made in the Dockerfile
* Swift deps can be managed by editing **Package.swift**.

If changes have been done to the dependencies, commit, and perform `git push hasura master` to deploy the changes.

## Migrating your existing vapor app

* If you have an existing Vapor app which you would like to deploy, replace the code inside `/microservices/api/swift-vapor/` according to your app.
* You may need to modify the Dockerfile if your build directory location has changed, but in most cases, it won't be required.
* Commit, and run `git push hasura master` to deploy your app.

## Adding backend features

Hasura comes with a few handy tools to make it easy to add backend features to your apps.

### Add instant authentication via Hasura’s web UI kit

Every project comes with an Authentication kit, you can restrict the access to your app to specific user roles.
It comes with a crisp UI for Signup and Login pages out of the box, which takes care of user registration and signing in.

![Auth UI](https://docs.hasura.io/0.15/_images/uikit-dark.png)

Follow the [Authorization docs](https://docs.hasura.io/0.15/manual/users/uikit.html) to add Authentication kit to your app.

### Add a custom API

Hasura project is composed of a set of microservices. These include certain Hasura microservices like, postgres, nginx, data API, auth API and more but can also include your own microservices.

* [Adding Microservice](https://docs.hasura.io/0.15/manual/custom-microservices/index.html)

### Add data APIs

Hasura comes with set of Data APIs to access the Postgres database which comes bundled with every Hasura cluster. You can use packages like [`Alamofire`](https://github.com/Alamofire/Alamofire) to make HTTP requests to the database.

Detailed docs of data APIs can be found [here](https://docs.hasura.io/0.15/manual/data/index.html).
