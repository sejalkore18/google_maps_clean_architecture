# google_maps_project


## Getting Started

The folder structure for this project is as follows: 

- lib<br>
    - app
        - home
            - data (This contains the implementation for the repository mentioned in domain.) <br>
            - domain<br>
                - entity
                - repository (This contains the abstract class that define the expected functionality.)
                - usecase
            - presentation <br>
                - states (This contains the view that will be shown when a particular state is triggered)
                - widgets 
                - home_state_machine.dart (This file contains the events and corresponding states that will be shown when an event is triggered.)
                - home_presenter.dart (Presenter acts as a point of contact between the usecase and the controller. It is responsible for calling out the usecase that again calls out the api function from home_repository_implementation.dart)
                -home_controller.dart (Controller acts as a mediator between the view and the presenter. It is also responsible for triggering events based on the response from the presenter.)
                -home_view.dart (View decides what is to be shown when a particular state is triggered)
    -core
        - services
        - injection_container.dart
        - observer.dart
        - state_machine.dart
        
    - utils 
        - keys (This contains the keys that are used in the api.)
        - parse functions (This contains the parse function to map the api response into the suitable entities.)
        
        



