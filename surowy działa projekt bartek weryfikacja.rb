class Account
  attr_reader :login_name
  
  def initialize(login_name)
    @login_name = login_name
  end
  
  def log_in(login_password)
    login_password == password ? puts("Welcome #{@login_name}!") : login_password_error
  end
  
  private
  
  def password
    @password = 1234
  end
  
  def login_password_error
    puts "Access denied: incorrect password."
    exit
  end
end

puts "Username"
user = gets.chomp
puts "Password"
identification = gets.chomp
my_account = Account.new(user.to_s)
my_account.log_in(identification.to_i)

movies = {
  Batman: 5, 
  Spiderman: 6
  }

loop do
  
  def menu
    puts "\n"
    puts "Menu" 
    puts "What would you like to do:"
    puts "  Input: 'add' to add a new movie with rating to a library"
    puts "  Input: 'update' to update an existing movie with a new rating"
    puts "  Input: 'display' to display a movie library"
    puts "  Input: 'delete' to delete a movie from library"
    puts "\n"
    puts "  Input: 'exit' to close an app"
    puts "\n"
  end

  puts menu
  user_choice = gets.chomp.downcase

  case user_choice
  when "add"
    puts "What movie would you like to add?"
    title = gets.chomp.capitalize
    if movies[title.to_sym].nil? 
      puts "How do you rate this movie?"
      rating = gets.chomp.to_i
      if rating.between?(1,10)
        movies[title.to_sym] = rating
        puts "The movie has been added to the library."
      else
        puts "Rating of movie should have value 1 to 10."
      end
    else
      puts "That movie already exists! Its rating is #{movies[title.to_sym]}."
    end
  when "update"
    puts "What movie would you like to update? "
    title = gets.chomp
    if movies[title.to_sym].nil? 
      puts "That movie does not exist."
    else
      puts "What is the new rating? "
      rating = gets.chomp
      movies[title.to_sym] = rating.to_i
    end
  when "display"
    movies.map do | title, rating |
      puts "#{title}: #{rating}"
    end
  when "delete"
    puts "What movie would like to delete?"
    title = gets.chomp
    if movies[title.to_sym].nil?
      puts "That movie does not exist."
    else
      movies.delete(title.to_sym)
      puts "Movie has beed deleted."
    end
  when "exit"
    break
  else
    puts "You put a wrong input!"
  end
end
