# Guessing Number Game

This project is a game for guessing the number.

## Getting Started

You can clone or download this project directry by visit this URL: https://github.com/Crementae/GuessingNumberGame-master.git


### How To Use

1. Download the project by using this url https://github.com/Crementae/GuessingNumberGame-master.git.

2. Open the project by the name 'GuessingNumberGame.xcworkspace' file.

3. Run application on Xcode to play the game!!

### How To Develop

1. Create project name GuessingNumberGame and then pod init it.

2. Install pod libraly such as Alamofire, AlamofireObjectMapper and PromiseKit 
(Alamofire is used for http service, AlamofireObjectMapper is used for map the object with the model and
PromiseKit is used for async task).

3. Open the project by type name .workspace and then create model class for api.random.org/generateInteger.

4. Create HTTPClient file to used for http client services by using alamofire and PromisKit.

5. Create Alamofire + PromiseKit to support the return type when create api function.

6. Create APIServer file to create api function.

7. Create LibraryAPI with singleton instance to share api server anywhere in the project.

8. In main.storyboard, drag element that will be used in the project to ViewController

9. In the ViewController file, create @IBOutet var of each element and connect it to ViewController in main.storyboard. 
Then, create function that load generationInteger from api.random.org by called the api that we created in LibraryAPI.

10. After that, create function to check that if the number that input in the text field is match the number that we fetch
from api.random.org or not then display the result.



