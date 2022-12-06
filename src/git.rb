require_relative 'add'

sub_command = ARGV[0]
if sub_command == 'version'
    p sub_command
elsif sub_command == 'add'
    file_path = ARGV[1]
    add(file_path)
end
