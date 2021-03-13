require_relative "./scraper.rb"

class PopPulse::CLI3
  
  def run
    system("clear")
    loading_message
    sleep (2)
    greeting
    PopPulse::Scraper.scrape_albums
    list_albums
    while menu != 'exit'
  end
end
  
  def loading_message
    puts "________________________________"
    puts ""
    puts "------WELCOME TO POP PULSE------"
    puts "________________________________"
    sleep (2)
    puts ""
    puts "    Do you like Kanye West ?"
    puts ""
  end
  
  def greeting
    puts "-----------------------------------"
    puts ""
    puts "NO MATTER THE ANSWER, Kanye West is the most
fascinating pop artist of the 21st century."
    puts ""
    sleep (3)
    puts "Acclaimed and derided in equal measure, 
Kanye has quite the discography."
    puts ""
    sleep (3)
    puts "Choose an album from the list below and
enter its number to learn more."
    puts ""
    puts "Or type 'exit' to live a Kanye-free lifestyle."
    puts ""
    sleep (3)
    list_albums
  end

  def list_albums
    PopPulse::Album.all.each_with_index do |album, i|
      puts " #{index+1}. #{album.title}"
    end
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Enter the number."
    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i <= @album.size
      list_albums(input)
    elsif input == "list"
      list_albums
    elsif input == "exit"
      close_app
    else
      error
    end
  end
end

  def error
    puts ""
    puts "Try again, bucko."
    puts ""
  end

  
  def close_app
    puts ""
    puts "Wish Kanye well during his divorce proceedings :-("
    sleep (1)
    puts ""
    puts "Adios muchacho"
    puts ""
    exit
  end
end