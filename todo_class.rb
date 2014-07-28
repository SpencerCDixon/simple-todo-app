require 'colorize'

class Todo
  attr_accessor :tasks, :list_name

  def initialize
    @tasks = []
    get_list_name
  end

  def get_list_name
    print "What would you like to name your list? "
    @list_name = gets.chomp
    puts "#{list_name} was created"
    options
  end

  def options
    puts
    puts "What would you like to do?"
    puts "=========================="
    puts "[Add] to list".green
    puts "[Remove] from list".light_red
    puts "[Save] list for later".light_blue
    puts "[View] what's on your list".light_white
    puts "[Exit]"
    puts
    input = gets.chomp.downcase
      case input
      when /^a/i
        add
      when /^r/i
        remove
      when /^s/i
        save
      when /^v/i
        view
      when /^e/i
        exit
      else
        puts "Huh? That's not a command I understand :("
        puts "Please try a command I know!"
        options
      end
  end

  def add
    puts "What task would you like to add?"
    tasks << gets.chomp.downcase
    puts "Your list has been updated.\n"
    options
  end

  def remove
    puts "Which task would you like to remove?"
    remove = gets.chomp
    tasks.delete_if {|word| word == remove}
    options
  end

  def save
    f = File.new(list_name, 'a')
    f.puts tasks
    f.close
    options
  end

  def view
    puts "#{list_name.capitalize} List:"
    puts "#{'=' * list_name.size}======"
    tasks.each {|word| puts '-' + word}
    puts
    options
  end


end



list = Todo.new
