
def create
  puts "What will your To Do List be called?"
  answer = gets.chomp
  filename = answer + '.txt'
  if Dir['*.txt'].include?(filename) == false
    f = File.new(filename, 'a')
    f.write "#{answer.capitalize} To Do List:\n"
    f.write "#{'-'*answer.size}------------\n"
  else
     f = File.new(filename, 'a')
  end

  puts
  puts "The To Do List called '#{answer}' has been created"
  puts
  f.close
  task
end

def task
  puts "What would you like to do? Add task to list, create a new list, or see all your list options?"
  answer = gets
  case answer
  when /^a/i
    add
  when /^c/i
    create
  when /^s/i
    view_lists
  else
    puts "Huh?"
  end
end

def view_lists
  puts
  puts Dir['*.txt'].sort
  puts
  task
end

def add
  puts "Sounds productive! Which list do you want to add to?"
  print "List: "
  list_name = gets.chomp + '.txt'

  until  Dir['*.txt'].include?(list_name) == true
    puts "I don't think that list exists, please try again."
    print "List: "
    list_name = gets.chomp + '.txt'
  end

  puts "What task would you like to add to #{list_name}?"
  task = '-' + gets

    f = File.open(list_name, 'a')
    f.write(task)
    puts "Great! Added to #{list_name}"
    f.close
    puts "Would you like to see what's on your list? (y/n)"
    answer = gets.chomp

    if answer =~ /^y/i
      puts File.read(list_name)
      puts
      puts "Would you like continue? (y/n)"
      continue = gets.chomp
        if continue =~ /^y/i
         super
        else
          puts "Okay Goodbye. Great work today boss."
          exit
        end
    else
      puts "Thank you!"
      exit
    end

end




create

































