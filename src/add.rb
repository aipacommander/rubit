require 'digest/sha1'
require 'zlib'

def add(file_path)
    content = ''
    file_size = 0
    File.open(file_path, 'r') do |f|
        content = f.read
        file_size = f.size
    end

    header = "blob #{file_size}\0"
    store = header + content
    sha1 = Digest::SHA1.new
    sha1.update(store)
    sub_dir_name = sha1.hexdigest[0, 2]
    object_file_name = sha1.hexdigest[2, 40]

    # 圧縮ファイルを作成
    # save_object_path = "./git/objects/#{sub_dir_name}/#{object_file_name}"
    save_object_path = "./#{sub_dir_name}_#{object_file_name}"
    File.open(save_object_path, 'w') do |f|
        gz = Zlib::GzipWriter.new(f)
        gz.write(store)
    end

    # ハッシュ化
    # indexへ追記
end