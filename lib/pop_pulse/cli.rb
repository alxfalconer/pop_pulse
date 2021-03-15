require_relative "./scraper.rb"

class PopPulse::CLI
  
  def run
    system("clear")
    loading_message
    sleep (2)
    greeting
    PopPulse::Scraper.scrape_album
    list_albums
    menu != 'exit'
  end
end

def list_albums
  puts ""
  puts "Albums are listed from newest to oldest.
Enter the corresponding number to learn more:"
  puts ""
  @albums = PopPulse::Album.all
  @albums.each_with_index do |album, i|
    puts "#{i+1}: #{album.title}"
  end
end

def menu
  input = nil
  while input != "exit"
    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i <= @albums.size
      album_info(input)
    elsif input == "list"
      list_albums
    elsif input == "exit"
      close_app
    else
      error
    end
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
    puts "retrieving albums..."
    sleep (3)
    puts ""
  end

  def menu
    input = nil
    while input != "exit"
    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i <= @albums.size
      album_info(input)
    elsif input == "list"
      list_albums
    elsif input == "exit"
      close_app
    else
      error
    end
  end
end

  def album_info(input)
    album = @albums[input.to_i - 1]
    PopPulse::Scraper.scrape_album_page(album) if !album.rating
    puts ""
    puts "#{album.title.upcase}"
    puts ""
    puts "Release Date: #{album.date}"
    puts ""
    puts "Pitchfork Rating: #{album.rating}"
    puts ""
    puts "Review Excerpt: #{album.review.split(' ').slice(0,100).join(' ')}..."
    puts ""
    puts "For the full review, head to:"
    puts "#{album.url}"
    puts ""
    options
  end

  def options
    puts "Type list to see Kanye's discography again 
or exit to live a Kanye-free lifestyle."
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