require_relative '../../config/environment'
require_all 'lib'
require 'pry'

class CommandLineInterface
    attr_accessor :dog_name
    
    def greet
        puts 'Welcome to Busy Paws, the best dog walking app in the world!'
    end
end

def run
    cli = CommandLineInterface.new
    cli.greet        

    puts "Thinking of walking a dog? We can help you with that!"
    puts "Enter a dog's name to get started:"

    @dog_name = STDIN.gets.chomp
end

def does_dog_exist
    if Dog.find_by(name: @dog_name)
        puts "That's a real dog!"
        p Dog.find_by(name: @dog_name).appointments
    else
        puts "Sorry that dog doesn't exist."
    end
end

def show_appointments
    appointments = Dog.find_by(name: @dog_name).appointments
    appointments.each { |appointment|
        puts "#{appointment.dog.name} is going to be walked by #{appointment.walker.name}."
    }
end