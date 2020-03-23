require_relative '../../config/environment'
require_all 'lib'

# As a User, I want to be able to…
# browse available dogs
# read information about the dog i will be walking
# see all my previous walks
# see the dog’s previous walks
# schedule a dog walking appointment
# change my walking appointment
# cancel my walking appointment

class Interface
    attr_accessor :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    def greet
        puts 'Welcome to Busy Paws, the best dog walking app in the world!'
    end

    def get_walker_name
        puts "Thinking of walking a dog? We can help you with that!"
        @walker_name = prompt.ask("What's your name?") do |q|
            q.required true
            q.validate /\A\w+\Z/
            q.modify   :capitalize
          end
        Walker.create(name: @walker_name)
        puts "Hi #{@walker_name}!"
    end 

    def see_dogs
        answer = prompt.select("Would you like to see all our available dogs?", "Yes", "No")

        if answer == "Yes"
            puts "Great! Let's see those puppers."
        else
            puts "Boo hoo."
        end
    end 

    def all_dogs
        @dog_names = Dog.all.map { |dog|
            dog.name
        }
        puts "Here are all our available dogs: #{@dog_names.join(", ")}"
    end

    def dog_info
        @selected_dog = prompt.select("Which dog would you like to walk?", @dog_names)

        dog_age = Dog.find_by(name: @selected_dog).age
        dog_breed = Dog.find_by(name: @selected_dog).breed
        puts "#{@selected_dog} is #{dog_age}-years old and a #{dog_breed}."
    end

    def make_appointment
        @appt_date = prompt.ask("Which day would you like to walk #{@selected_dog}?", convert: :date)
        @appt_time = prompt.ask("What time would you like to walk #{@selected_dog}?", convert: :datetime)

        @appt_date = @appt_date.strftime("%m/%d/%Y")
        @appt_time = @appt_time.strftime("%I:%M %p") 

        p @appt_date
        p @appt_time
    end

    def show_appointment
        dog_id = Dog.find_by(name: @selected_dog).id
        walker_id = Walker.find_by(name: @walker_name).id
        Appointment.new(dog_id: dog_id, walker_id: walker_id, date: @appt_date, time: @appt_time)

        puts "Great! #{@walker_name}, your dog walking appointment is at #{@appt_time} on #{@appt_date} with #{@selected_dog}."   
    end

end