def init
    # 存在するならエラー文を表示する
    if Dir.exist?('.git-rubit')
        puts "Reinitialized existing Git repository in #{Dir.pwd}/.git-rubit/"
        return false
    end

    # 作成を開始
    # TODO: 作成自体ミスったらロールバックする処理が必要かも？
    # git本体はどうやって実装しているんじゃろうか
    Dir.mkdir('.git-rubit')
    File.new('.git-rubit/HEAD', 'w')
    File.new('.git-rubit/branches', 'w')
    File.new('.git-rubit/config', 'w')
    File.new('.git-rubit/description', 'w')
    Dir.mkdir('.git-rubit/hooks')
    Dir.mkdir('.git-rubit/objects')
    File.new('.git-rubit/objects/info', 'w')
    File.new('.git-rubit/objects/pack', 'w')
    Dir.mkdir('.git-rubit/refs')
    File.new('.git-rubit/refs/heads', 'w')
    File.new('.git-rubit/refs/tags', 'w')

    return true
end