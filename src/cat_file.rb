require 'zlib'

def cat_file(option, hash_value)
    if option == '-t'
        Zlib::GzipReader.open(hash_value) do |gz|
            puts gz.read
        end

        return '-t'
    elsif option == '-p'
        return '-p'
    else
        puts 'そのようなoptionは存在しません'
    end
end