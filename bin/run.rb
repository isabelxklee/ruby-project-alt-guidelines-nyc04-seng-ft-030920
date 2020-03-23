require_relative '../config/environment'
require_all 'lib'

interface = Interface.new()
interface.greet
interface.get_walker_name
interface.see_dogs
interface.all_dogs
interface.dog_info
interface.make_appointment
interface.show_appointment

# think about writing class methods vs. instance methods for prompt tty

# make_appointment

# does_dog_exist

# show_appointments