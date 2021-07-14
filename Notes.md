Step 1: Set up Environment
    - bundle
    - bundle update
    - rake -T


Step 2: Understanding what is happening under the hood @ 3.00
    - For this example we use Doctor <=> Appointment <=> Patient
    - Note:
        - bin/run.rb 
            -requires our environment. We will use this to run our application 
        - config/environment.rb     
            - requires our Bundler
            - establishes a connection with the databate
            - requires all 'lib' files which is where we want to run our models since enivronment has access to this file

        - Models interacts with the database
        - database is persisted so we start with the database (migration first) 
        - lib (model-view-controller - relationship and actions) | bin (view)

Step 3: Create Migration Tables @ 6:50
    - rake db:create_migration NAME="create_doctors"
        - This will create a db file with our migration tables
        - Inside this file, inside the #change we create our table of doctors 
            ex. 
                class CreateDoctors < ActiveRecord::Migration[6.1]
                    def change
                        create_table :doctors do |t|
                        t.string :name
                        t.string :speciality
                    end
                end
    - rake db:migrate (updates/ runs migrations that have not ran yet and places these inside our schema)
    - rake db:rollback (Works one at at time for reverting to previous before table creations)

Step 4: Build Models in lib @13.00
    - Create files with class doctor, appointment, patient
    - Establish the model relationships
        - Doctor <=> Appointment <=> Patient
            - belongs_to :doctor/:actor
            - has_many :appointments
            - has_many :doctors/:actors , through: :appointments
    - Once relationships are established we can run our code by testing the run.rb which loads the environment which runs the `lib` folder which runs our models/apps
    - ruby bin/run.rb

    LETS REVIEW - @17.00
        - We have a migration ( a way to save stuff )
        - We have a model ( a way to interact with that stuff )
        - Bc we inherit from AR, our classes receive .new | .save | .create the model sets up how we interact w/ database
        - We do not have anything in the database, to add to the database we add instances in our seed file.

Step 5: Add Creation Instances in Seeds files @20.00
    - Destroy all instances at the top
    - Create instances and run it w/ rake db:seed
        - If nothing happens then our code is running properly
    - Run rake console
        - command: Doctor.all
        - If all is well, we should see a list of doctors 
    - Create instance of Patients and Appointments
        -Note we store doctors & patients in variables bc we want to reference them later in our Appointments Instances
    - rake db:seed (after creating instances)
    - rake console (to test code)
    

clone > bundle > migrations > models > seed file > run it > build fun stuff
run.rb runs our files to interact with our database

Step 6: Create TTY Prompts @29.25
    - gem 'tty- prompt' or gem install tty-prompt
    - run bundle to use tty-prompt
    - create a new instance of prompt = TTY::Prompt.new
        - TTY - is a gem jsut like AR
        - Prompt - is a module in it, just like AR
        - dot.new - is a class method that we can call on Prompt. Which is calling a new class of that method
        - .ask - Ask the user as question
        - .mask - hids the response


