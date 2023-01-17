classDiagram
  class UserModel
  class SpaceModel
  class BookingModel
  class UserRepository
  class BookingRepository
  class SpaceRepository
  class Application
  class DatabaseConnection

Application <|-- UserModel
Application <|-- SpaceModel
Application <|-- BookingModel
UserModel <|-- UserRepository
BookingModel <|-- BookingRepository
SpaceModel <|-- SpaceRepository
UserRepository <|-- DatabaseConnection 
BookingRepository <|-- DatabaseConnection 
SpaceRepository <|-- DatabaseConnection 

class Application {
    
}

  class UserRepository {
    +all()
    +find()
    +create()
}
  class BookingRepository {
    +all()
    +find()
    +create()
}
  class SpaceRepository {
    +all()
    +find()
    +create()
}

  class UserModel {
    +Int id 
    +string first_name
    +string last_name
    +string username
    +string email_address
    +string password
    +date user_created_date
    +login()
    +signup()
    +signout()
    +create_space()
    +create_booking()
    +confirm_booking()
}
  class SpaceModel {
    +int id  
    +int user_id
    +string name
    +string first_address_line
    +string second_address_line
    +string city
    +string country
    +string postcode
    +float price_per_night
    +boolean booking_approved?
    +date space_created_date
    +make_space_available(id,user_id,start_date,end_date)

  }

  class BookingModel {
    +int id 
    +date booking_start_date
    +date booking_end_date
    +int user_id 
    +int space_id
    +boolean booking_approved?
  }
