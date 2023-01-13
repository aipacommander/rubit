require 'digest/sha1'
require 'zlib'

def add(file_path)
    content = ''
    file_size = 0
    File.open(file_path, 'r') do |f|
        content = f.read
        file_size = f.size
    end

    # git objetのフォーマット: `Objectの種類 データのサイズ\0データ`
    header = "blob #{file_size}\0"
    store = header + content
    sha1 = Digest::SHA1.new
    sha1.update(store)
    # 検索向上のために先頭2文字のディレクトリを用意する
    sub_dir_name = sha1.hexdigest[0, 2]
    object_file_name = sha1.hexdigest[2, 40]

    # 圧縮ファイルを作成
    # TODO: 絶対パス的ななにかが必要な気持ち
    # gitリポジトリ管理化だと、下の階層に潜っても適切に.git以下にファイルを作成してくれるので
    # その実装が必要
    save_object_dir = ".git-rubit/objects/#{sub_dir_name}"
    Dir.mkdir(save_object_dir) unless Dir.exist?(save_object_dir)

    # 同じハッシュ値が作成されていないか確認。存在するならblobは作成しない
    save_object_path = "#{save_object_dir}/#{object_file_name}"
    unless File.exist?(save_object_path)
        Zlib::GzipWriter.open(save_object_path) do |gz|
            gz.write(store)
        end
    end

    # indexへ追記
end