require 'zlib'

def cat_file(option, hash_value)
    if option == '-t'
        store = ''
        Zlib::GzipReader.open(hash_value) do |gz|
            store = gz.read
        end

        # ファイルフォーマットの次の文字が空文字なので
        # 最初の空文字の位置を探す
        file_type_last_index = store.index(/\s/)
        # 0~から最初の空文字を含まないところまでslice
        file_type = store.slice(0...file_type_last_index)
        puts file_type
    elsif option == '-p'
        puts '-p'
    else
        puts 'そのようなoptionは存在しません'
    end
end