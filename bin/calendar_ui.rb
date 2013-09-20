require 'active_record'
require './lib/event'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuration)

def home
  puts "Welcome to your calendar!"

  menu
end

def menu
  puts "Type 'New' to add a new event to your calendar."
  puts "Type 'View' to view all of your calendar events."
  puts "Type 'Exit' to return home."
  choice = gets.chomp
  case choice
  when 'New'
    new_event
  when 'View'
    all_events
  when 'Exit'
    puts "Good-bye!"
  else
    puts "Invalid"
  end
end

def new_event
  puts "Enter the name of the new event:"
  event_name = gets.chomp

  puts "Enter the description for the new event:"
  event_description = gets.chomp

  puts "Enter the location for the new event:"
  event_location = gets.chomp

  puts "Enter the start date and start time for the new event <yyyy-mm-dd hh:mm:ss>:"
  event_start = gets.chomp

  puts "Enter the end date and end time for the new event <yyyy-mm-dd hh:mm:ss>:"
  event_end = gets.chomp

  event = Event.new(:name => event_name, :description => event_description, :location => event_location, :start_date_time => event_start, :end_date_time => event_end)
  event.save
  menu
end


def all_events
  Event.all.each { |event| puts event.name }

  puts "Type 'Edit' to edit an event."
  puts "Type 'Delete to delete an event."
  choice = gets.chomp
  case choice
  when 'Edit'
    edit
  when 'Delete'
    delete
  else
    puts "Invalid"
  end
  menu
end

def delete
  event_to_delete = choose_event
  event_to_delete.destroy
  menu
end

def edit
  event_to_edit = choose_event
  puts "[n]ame, [d]escription, [l]ocation, [s]tart_date_time, [e]nd_date_time, e[x]it"
  attribute_choice = nil
  attribute_choice = gets.chomp
  until attribute_choice == 'x'
    case attribute_choice
    when 'n'
      puts "What would you like to change the name to?"
      edited_name = gets.chomp
      event_to_edit.update(:name => edited_name)
    when 'd'
      puts "What would you like to change the description to?"
      edited_description = gets.chomp
      event_to_edit.update(:description => edited_description)
    when 'l'
      puts c
      edited_location = gets.chomp
      event_to_edit.update(:location => edited_location)
    when 's'
      puts "What would you like to change the start date and time to?  <yyyy-mm-dd hh:mm:ss>"
      edited_start_date_time = gets.chomp
      event_to_edit.update(:start_date_time => edited_start_date_time)
    when 'e'
      puts "What would you like to change the end date and time to?  <yyyy-mm-dd hh:mm:ss>"
      edited_end_date_time = gets.chomp
      event_to_edit.update(:end_date_time => edited_end_date_time)
    when 'x'
      puts "Good-bye."
      menu
    else
      puts "Invalid Entry"
      edit
    end
    menu
  end
end

def choose_event
  puts "Here are all of your events:"
  events = Event.all.each_with_index { |event, index| puts index.to_s + " " + event.name }
  puts "Enter the number associated with the event that you would like to choose:"
  events[gets.chomp.to_i]
end

menu
