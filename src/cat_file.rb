require 'zlib'

def read_gz_file(hash_value)
    store = ''
    Zlib::GzipReader.open(hash_value) do |gz|
        store = gz.read
    end
    store
end

def cat_file(option, hash_value)
    if option == '-t'
        store = read_gz_file(hash_value)
        # ファイルフォーマットの次の文字が空文字なので
        # 最初の空文字の位置を探す
        file_type_last_index = store.index(/\s/)
        # 0~から最初の空文字を含まないところまでslice
        file_type = store.slice(0...file_type_last_index)
        puts file_type
    elsif option == '-p'
        store = read_gz_file(hash_value)
        file_type_nil_str_index = store.index(/\0/)
        file_body = store.slice(file_type_nil_str_index...)
        puts file_body
    else
        puts 'そのようなoptionは存在しません'
    end
end