## Obfuscated Name Printer

The goal of this challenge is to write a program that is so hard to understand
that it is considered a piece of art. So difficult to read that a linter would
enter an endless loop. So mind-numbingly confusing that even Chuck Norris could
not refactor it.

Of course, like all programs it must do something useful. For the sake of this
challenge, it must simply print out _your_ name. That's it.

### Submission Guide

1. To submit your program, place the file in a subdirectory with your email handle (e.g. `<REPO>/obfuscated/collier/my_name_factory_factory.rb`), open a PR against this repository, and tag @tcollier
1. The program must be submitted by 2018-10-16T06:59:59Z
1. You are allowed one submission per programming language
1. Submissions must successfully print the submitters full name (and nothing else) when run on the test machine (Tom's laptop)
1. Programs must not take any command line arguments

### Prior Art

* [Fifth Obfuscated Perl Contest](https://www.foo.be/docs/tpj/issues/vol5_3/tpj0503-0014.html)
* [Obfuscated C Code](https://www.quora.com/What-is-the-most-obfuscated-C-code-you-have-ever-seen)

### Example

```ruby
# my_name_factory_factory.rb
class FactoryInterface
  def build(*)
    raise NotImplemented, 'This is an abstract class'
  end
end

class AbstractSeparatorFactory < FactoryInterface
  attr_reader :separator

  def initialize(separator)
    @separator = separator
  end
end

class SeparatorFactory < FactoryInterface
  def build(language)
    unless language == "English"
      raise ArgumentError, "Unsupported language: #{language}"
    end
    " "
  end
end

class FirstNameFactory < AbstractSeparatorFactory
  def build(full_name)
    full_name.split(separator).first
  end
end

class FirstNameFactoryFactory < FactoryInterface
  def build(separator)
    FirstNameFactory.new(separator)
  end
end

class LastNameFactory < AbstractSeparatorFactory
  def build(full_name)
    full_name.split(separator).last
  end
end

class LastNameFactoryFactory < FactoryInterface
  def build(separator)
    LastNameFactory.new(separator)
  end
end

class FullNameFormatterFactory < AbstractSeparatorFactory
  def build(first_name, last_name)
    [first_name, last_name].join(@separator)
  end
end

class FullNameFormatterFactoryFactory < FactoryInterface
  def build(separator)
    FullNameFormatterFactory.new(separator)
  end
end

class OutputAdapter
  def print(string)
    puts string
  end
end

class OutputFactory < FactoryInterface
  def build
    OutputAdapter.new
  end
end

def main(raw_input)
  output_factory = OutputFactory.new
  first_name_factory_factory = FirstNameFactoryFactory.new
  last_name_factory_factory = LastNameFactoryFactory.new
  separator_factory = SeparatorFactory.new
  full_name_formatter_factory_factory = FullNameFormatterFactoryFactory.new

  output_object = output_factory.build
  separator = separator_factory.build("English")
  first_name_factory = first_name_factory_factory.build(separator)
  last_name_factory = last_name_factory_factory.build(separator)
  full_name_formatter_factory = full_name_formatter_factory_factory.build(separator)
  first_name = first_name_factory.build(raw_input)
  last_name = last_name_factory.build(raw_input)
  full_name = full_name_formatter_factory.build(first_name, last_name)
  output_object.print(full_name)
end

main("Tom Collier")
```

```
ruby my_name_factory_factory.rb
Tom Collier
```
