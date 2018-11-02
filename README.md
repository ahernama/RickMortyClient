# Rick and Morty Guide iOS App

Application developed in Swift 4.0 that shows information about episodes and characters from the Rick and Morty TV Show. The architecture with which it has been developed is **MVP (Model View Presenter)** .This allows the view to be independent (UIViews and UIViewControllers) of all logic, and only sends the corresponding user events to the Presenter.

## About the project

This project has been developed as a model to implement the MVP architecture in Swift and to use it as a template for future products.

![MVP](https://cdn-images-1.medium.com/max/1600/1*hKUCPEHg6TDz6gtOlnFYwQ.png)

If you access the project, you can see how this same structure is represented in folders. For each of the functionality modules you can find differentiated model, view controllers, and for each of them, presenters.

### Other platforms

If you want to find this same exercise on other platforms (in different architectures) you can visit the following repositories:

* [Amazon Alexa Skill](https://github.com/ahernama/RickMortySkill) - Skill implemented for Amazon Alexa that fulfills the same functionality. Communication model in JSON and Backend in Node.js for deployment in Amazon Lambda.

###  Features

* Paginated list of episodes (the next page is requested as the time the user reaches the end of the scroll). **A small delay has been added to be able to check the loading status in the list**
* Persistence of information once requested, both episodes and characters, to minimize the number of requests.
* Access to episode detail with the possibility to filter all its characters by its status (local filtering once requested information)

###  Main libraries and resources

* [Alamofire](https://github.com/Alamofire/Alamofire) - HTTP request and remote image loading.
* [RealmSwift](https://realm.io/docs/swift/latest/) - Database to persist the information requested. Once we have the information there, Realm will be in charge of providing it to the managers whenever it could be necessary.
* [ObjectMapper](https://github.com/tristanhimmelman/ObjectMapper) - In order to parse JSON data from API request to project model.
* [MaterialComponents](https://github.com/material-components) - To include material elements such as the flexible header.
* [Firebase](https://firebase.google.com/docs/ios/setup) -  popular google platform, management of application use, notifications, authentication ... (integration removed from public version)
* [Fabric](https://docs.fabric.io/apple/fabric/overview.html) - application use management and crash record

###  Next release

* Dependency injection structure

## Screenshots

 Splash  |  Episodes List  |  Episode Detail
------------- | ------------- | -------------
![screenshot_splash](https://user-images.githubusercontent.com/7911148/47891315-04dc5300-de53-11e8-8ff1-6b3ed1203d2d.PNG)  | ![screenshot_episodeslist](https://user-images.githubusercontent.com/7911148/47891331-158cc900-de53-11e8-95d0-aba8c40ac7bb.PNG)  | ![screenshot_episodedetail](https://user-images.githubusercontent.com/7911148/47891319-073ead00-de53-11e8-8f43-d8cf55727ad2.PNG)

## License

    MIT License

    Copyright (c) 2018 Alex Hernández

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.


