# Night Writer
> This is a final project for Turing's Mod 1 utilizing Ruby, TDD, and Files to translate text to [Braille](https://en.wikipedia.org/wiki/Braille) and back again
![braille_demo](https://user-images.githubusercontent.com/98674727/179305489-f94f4cf1-fc92-4d27-a496-3ab8d16c3226.gif)


## A little taste
```sh
def format_braille
  @braille
  split_messages = split_lines(@read_english)
  split_messages.each do |split_message|
      top = ""
      middle = ""
      bottom = ""
      split_message.split("").each do |letter|
          top << receive_character(letter)[0]
          middle << receive_character(letter)[1]
          bottom << receive_character(letter)[2]
      end
      @braille.write("#{top}\n#{middle}\n#{bottom}\n")
  end
  @braille.close
end
```
## Technologies
- Ruby
- Pry
- RSpec
- Simplecov

## Learning Outcomes
- Breaking a program into logical components
- Unit and Integration testing
- Applying Enumerables
- Reading text files and writing to text files
