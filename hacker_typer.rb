# Hacker Typer by Vincent Colavin
# Clone of hackertyper.net
# It takes a file name argument in the command line.

system 'stty cbreak' # I don't know what this does but it is important.

module HackerTyper

  def self.hack_type(text)
    # Splits given text into chunks according to selected speed
    chars_per_keystroke = 3
    text_array = text.chars.each_slice(chars_per_keystroke)

    print "\e[H\e[2J" # clear screen

    text_array.each do |word|

      $stdin.sysread 1 # This will halt the program until a key is pressed
      print "\b"

      word.each do |character|
        print " " if character == "\n"
        print character
      end

    end

  end

end

# build time
# ---
# run time

file_name = ARGV[0] || "hacker_typer.rb"

file_text = File.open(file_name, "rb").read

HackerTyper.hack_type(file_text)

system 'stty cooked'
