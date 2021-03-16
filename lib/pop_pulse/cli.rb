require_relative "./scraper.rb"
require 'colorize'

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
  puts "Learn more about a specific album by entering its number
or type 'exit' to live a Kanye-free lifestyle: \n\n"
  @albums = PopPulse::Album.all
  @albums.each_with_index do |album, i|
    puts "#{i+1}. #{album.title}".light_blue
  end
end

def self.kanye
  puts ""

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
    puts "________________________________\n\n".magenta
    puts "------WELCOME TO POP PULSE------\n\n".white.on_magenta
    puts "________________________________\n\n".magenta
    sleep (2)
    puts "    Do you like Kanye West ?\n\n".light_blue
  end
  
  def greeting
    puts "--------------------------------\n\n".magenta
    puts "NO MATTER THE ANSWER, Kanye West is the most
fascinating pop artist of the 21st century.\n\n"
    sleep (3)
    puts "Acclaimed and derided in equal measure, 
Kanye has quite the discography.\n\n"
    sleep (3)
    puts "retrieving albums...\n\n"
    sleep (3)
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
    puts "#{album.title.upcase}\n\n".light_blue
    puts "Release Date: #{album.date}\n\n"
    puts "Pitchfork Rating: #{album.rating}\n\n"
    puts "Review Excerpt: \n\n#{album.review.split(' ').slice(0,100).join(' ')}...\n\n"
    puts "For the full review, head to:"
    puts "#{album.url}\n\n"
    options
  end

  def options
    puts "Type list to see Kanye's discography again 
or exit to live a Kanye-free lifestyle.\n\n"
  end


  def error
    puts "Try again, bucko.\n\n"
  end

  
  def close_app
    puts "\n\nWish Kanye well during his divorce proceedings :-(\n\n"
    sleep (1)
    puts "Adios muchacho\n\n"
    exit
  end