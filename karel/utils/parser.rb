require_relative '../command/native'
require_relative '../command/if'
require_relative '../command/not'
require_relative '../command/program'
require_relative '../command/user_defined'
require_relative '../command/while'

INDENTATION = '  '.freeze

module Utils
  class Parser
    def self.parse(file)
      commands = Command::NATIVE.dup
      stack = [Command::Program.new]
      line_no = 0
      File.readlines(file).each do |raw_line|
        line = raw_line.rstrip.gsub(/#.*/, '')
        line_no += 1
        curr_indent = INDENTATION * (stack.length - 1)
        udf_match = line.match(/^def ([\w]+)$/)
        if_match = line.match(/^#{curr_indent}if (\!)?([\w]+)$/)
        while_match = line.match(/^#{curr_indent}while (\!)?([\w]+)$/)
        command_match = line.match(/^#{curr_indent}([\w]+)$/)

        if udf_match
          if commands.key?(udf_match[1])
            raise SyntaxError, "Line #{line_no}: command '#{udf_match[1]}' is already defined"
          end
          stack.push(Command::UserDefined.new(udf_match[1]))
        elsif if_match
          unless commands.key?(if_match[2])
            raise SyntaxError, "Line #{line_no}: command '#{if_match[2]}' not recognized"
          end
          command = commands[if_match[2]]
          condition = if_match[1] ? Command::Not.new(command) : command
          stack.push(Command::If.new(condition))
        elsif while_match
          unless commands.key?(while_match[2])
            raise SyntaxError, "Line #{line_no}: command '#{while_match[1]}' not recognized"
          end
          command = commands[while_match[2]]
          condition = while_match[1] ? Command::Not.new(command) : command
          stack.push(Command::While.new(condition))
        elsif command_match
          if commands.key?(command_match[1])
            stack.last.add_statement(commands[command_match[1]])
          else
            raise SyntaxError, "Line #{line_no}: command '#{command_match[1]}' not recognized"
          end
        elsif stack.length > 1
          prev_indent = INDENTATION * (stack.length - 2)
          if line.match(/^#{prev_indent}else$/)
            if stack.last.is_a?(Command::If)
              begin
                stack.last.else!
              rescue ArgumentError => error
                raise SyntaxError, "Line #{line_no}: #{error.message}"
              end
            else
              raise SyntaxError, "Line #{line_no}: unexpected 'else' statement"
            end
          elsif line.match(/^#{prev_indent}end$/)
            statement = stack.pop
            if statement.is_a?(Command::UserDefined)
              commands[statement.name] = statement
            else
              stack.last.add_statement(statement)
            end
          elsif line =~ /#{curr_indent} /
            raise SyntaxError, "Line #{line_no}: invalid indentation"
          else
            raise SyntaxError, "Line #{line_no}: command '#{line}' not recognized"
          end
        elsif line =~ /#{curr_indent} /
          raise SyntaxError, "Line #{line_no}: inconsistent indentation"
        elsif line.strip != ''
          raise SyntaxError, "Line #{line_no}: command '#{line}' not recognized"
        end
      end

      raise SyntaxError, 'Unexpected end of input' if stack.length > 1
      stack.pop
    end
  end
end
