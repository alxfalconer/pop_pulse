require_relative "./scraper3.rb"

class PopPulse::CLI3
  
  def run
    system("clear")
    loading_message
    sleep (2)

    PopPulse::Scraper3.new.scraper
    greeting
    while menu != 'exit'
  end
end
  
  def loading_message
    puts "________________________________"
    puts ""
    puts "------WELCOME TO POP PULSE------"
    puts "________________________________"
    puts ""
    puts "    Do you like Kanye West ?"
    puts ""
  end
  
  def greeting
    puts "-----------------------------------"
    puts "NO MATTER THE ANSWER, Kanye West is the most fascinating pop artist of the 21st century."
    puts ""
    puts "Acclaimed and derided in equal measure, the polarizing figure has quite the body of work under his belt."
    puts ""
    puts "Choose an album and enter the corresponding number to learn more."
    puts "Or type 'exit' to live a Kanye-free lifestyle."
    puts ""
    menu
    list_albums
  end
  
  def menu
    input = gets.strip.downcase
    if input == nil
    list_albums
    else "exit"
      close_app
    end
  end
  
  def close_app
    puts "Wish Kanye well during his divorce proceedings :-("
    sleep (1)
    puts "Adios muchacho"
    sleep (1)
    exit
  end
  
  def list_albums
    PopPulse::Albums3.all.each_with_index do |info, index| 
      puts "#{index+1} #{info.name}"
    end
  end
end