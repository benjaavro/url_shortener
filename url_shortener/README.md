# **Flutter Provider Architecture**

## __Overview__
This a proposal Architecture for Flutter apps development merging good practices from Clean Architecture, BLOC Architecture & a bit of personal development experience. This pattern can be used for any Flutter app; mobile, web & desktop, and is intended to be used whenever we need to interact with Firebase, Google Cloud & any API out there.

One of the main purposes of using this pattern is to standardize maintainability, reusability and readability of code. Methods must not be written more than once and code must be there to reuse it as many times as it can be helpful.

It is composed of 3 main layers; domain, logic & presentation layers. Each of these layers stores classes and functions with specific roles. Communication between layers can be in ascending and descending but it's components direct interaction can only be with a contiguous layer. Ex: Domain Layer can only interact with elements inside Logic Layer, it should NEVER exist any kind of direct communication between Domain & Presentation layer.

For better explanation, here is a detailed description about every layer and component that can exist in this kind of app.

#### __Outside World__
As the name of this component says, here there are any kind of BaaS, SaaS, Database, Cloud Service & API that the app requires. Any element in "Outside World" is an element we can't control its functionality and we do not care how it works internally, our app just makes requests to obtain any necessary data, file or 3º party service. Example: Firebase, GCP, Numbers API, etc.

#### __Domain Layer__
The domain layer is composed of all the classes and methods that interact directly with the outside world, here we will be storing, requesting and parsing data for app's internal usage. Domain Layer stores 2 main kind of files:

* ##### Services
This kind of file stores methods that directly make requests to the outside world. Any service must be in this layer besides with which 3º party provider it is communicating, it might receive the raw data from the request response and delegate it's manipulation to any other component in the system; a model or other element in the Logic layer. __Example: FireStore document addition, Firebase Auth request, any API request, etc.__

* ##### Models
Model Components that are used to encapsulate objects of certain types. When you retrieve data from the outside world you might need to format it correctly into a standardized object that you're going to manipulate later in another layer. These model objects (classes) are composed of "standard" attributes and factory methods like toJson() and fromJson(). Any method that turns a value into a desired format like dates, should be inside these objects for later usage. __Example: Posts_Model, FirebaseAuth_Model, etc.__


#### __Logic Layer__
Inside Logic Layer we store any business logic and state management method. Whenever we need to do "something" with "some" I/O this layer is in charge of doing whatever we want to do. We could say Logic Layer is app's brain and it requests other components to do whatever it needs. It's the only layer that can communicate with both, Domain & Presentation Layers, for request or response of any desired data. Logic Layer might be composed of two type of components:


* ##### Data Manipulation / Logic Components
These types of components are the ones which communicate with upper and lower layers to deliver or request the data that the app requires to accomplish any _*use case*_. It is also in charge of doing any kind of operation with data, such as math, strings concatenation, data comparing, among others. __Example: calculate order total, validate input text, request for data stream from collection, etc.__

* ##### Providers
For cleaner and more optimized coding we can manage state with Providers so we avoid drilling between Widgets. Providers allow our app to share data between Widgets from different parts of the app. When you place a Provider widget in your widget tree all the Childs of the Provider will have access to the values exposed by it. Providers replace Stateful Widgets, and this will have a big impact on app performance because Providers only rebuild the widgets that are listening to any change, while setState() rebuilds everything. For more information about this go to [this article](https://medium.com/theotherdev-s/starting-with-flutter-a-simple-guide-for-provider-401b25957989) or [official docs](https://pub.dev/packages/provider). __Example: display on screen a keyboard input, change theme colors, any app setting, a stream controller for an output, etc.__


#### __Presentation Layer__
This layer is the one in charge of displaying UI and final data into the user's screen. Here there should not be any data processing methods, outside world requests or business logic, it should only display ui elements or do something with users input delegating any data processing to Logic Layer and should never interact directly with Domain Layer, nor Outside World. Presentation Layer can be built of any these two types of components:


* ##### Widgets
As we know, anything in Flutter is a Widget, but in this layer we are focusing on visual Widgets / UI elements. These types of components are basic widgets which accomplish specific and unique functionality. __Example: buttons, cards, dropdowns, etc.__


* ##### Screens
This type of components are any screen of the app, it can be composed by any type of widgets. In case there is any input from users it might delegate any processing to the Logic Layer. Any widget from your screen can consume data from declared Providers or Logic Components and display it to users. __Example: SignIn_Screen, Profile_Screen, etc.__

#### __Users Devices__
As obvious as it's name says, this component is the user's devices; mobiles, tablets or computers. It's only interaction can be with the Presentation Layer. __Example: Karens' iPhones, Designers' MacBook Pros, Gamers' PCs, etc.__


\

## __Files Structure__
To support our architecture proposal we need to distribute our project files in a way that allows easy integration between layers but also supports maintainability, reusability and readability goals.

There are two main folders composing our project; core & features. Core folder might store any method, widget, class, config, string or anything that can be reused in other parts of the system. Features folder might separate our app into main features like "screens" so everything (ui & logic) related to "X_Screen" is inside the "X" subfolder.

Any outside world communication might be inside lib/core/services.
Reusable widgets such as buttons and cards must be inside lib/core/common_widgets.

Our proposal of directories structure is shown below.


#### __Files Structure Example__
```
MyDummyApp/
|-- android/
|-- build/
|-- ios/
|-- lib/
|   |-- core/
|   |   |-- caches/
|   |   |   `-- shared_preferences/
|   |   |-- constants/
|   |   |   |-- colors.dart
|   |   |   `-- strings.dart
|   |   |-- models/
|   |   |-- routes/
|   |   |-- providers/
|   |   |-- services/
|   |   |   |-- auth/
|   |   |   |-- db/
|   |   |   |   |-- delete_document.dart
|   |   |   |   |-- retrieve_document.dart
|   |   |   |   `-- collection_stream.dart
|   |   |   |-- storage/
|   |   |   `-- cloud_functions/
|   |   |-- common_widgets/
|   |   |   |-- buttons/
|   |   |   |-- dialogs/
|   |   |   `-- cards/
|   |   `-- assets/
|   |-- features/
|   |   |-- login/
|   |   |   |-- ui/
|   |   |   |   `-- login_screen.dart
|   |   |   `-- logic/
|   |   |       |-- login_request.dart
|   |   |       `-- input_validation.dart
|   |   |-- signup/
|   |   |-- main/
|   |   |   |-- feed/
|   |   |   |   |-- ui/
|   |   |   |   `-- logic/
|   |   |   |-- profile/
|   |   |   `-- calendar/
|   |   `-- settings/
|   `-- main.dart
|-- test/
|   |-- core/
|   |   |-- caches/
|   |   |-- constants/
|   |   |-- models/
|   |   |-- routes/
|   |   |-- providers/
|   |   |-- services/
|   |   |-- common_widgets/
|   |   `-- assets/
|   `-- features/
|       |-- login/
|       |-- signup/
|       |-- main/
|       `-- settings/
|-- web/
|-- pubspec.lock
|-- pubspec.yaml
`-- README.md
```

## __Tests__
This pattern empowers unit tests and widgets tests to increase app reliability. Tests might be stored on mirrored folders structure from "lib" folder, but placed inside "test" folder. 