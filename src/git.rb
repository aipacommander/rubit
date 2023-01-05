require_relative 'add'
require_relative 'cat_file'

sub_command = ARGV[0]
if sub_command == 'version'
    p sub_command
elsif sub_command == 'add'
    file_path = ARGV[1]
    add(file_path)
elsif sub_command == 'cat-file'
    option = ARGV[1]
    file_path = ARGV[2]
    cat_file(option, file_path)
end
