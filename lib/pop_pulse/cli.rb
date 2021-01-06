# CLI Controller

class PopPulse::CLI

    def call
        puts "In March 2020, COVID-19 reduced life to a glacial pace. Was this shift reflected in music listening habits? Or did listeners turn to the sounds that comforted them the previous year? Using Spotify’s API, Pop Pulse compares the most popular songs of 2019 and 2020, month-by-month, using BPM, genre and “mood” signifiers to gauge shifting tastes."
        list_months
        menu
        goodbye
    end

    def list_months
        puts <<-DOC
        1. March
        2. April
        3. May
        4. June
        5. July
        6. August
        7. September
        8. October
        9. November
        10. December
        DOC
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the month you'd like to compare or type list to see the list again or type exit:"
            input = gets.strip.downcase
            case input
            when "1"
                puts "In March 2019, Spotify’s most streamed song was (song) by (artist), a (genre) song with a (mood) mood and BPM of (BPM).

                In March 2020, Spotify’s most streamed song was (song) by (artist), a (genre) song with a (mood) mood and BPM of (BPM)."
            when "list"
                list_months
            else
                puts "FOLLOW THE RULES! Type list or exit."
            end
        end
    end

    def goodbye
        puts "Adios muchacho"
    end
end
        