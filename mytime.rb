class Mytime < Formula
    homepage "https://github.com/SmallFishCode/homebrew-mytime"
    url "https://github.com/SmallFishCode/homebrew-mytime/releases/download/v0.0.3/mytime-v0.0.3.tar.gz"
    sha256 "f173a64b2e2317afc77095970b4a8964eeab87c38d9c35331da17af2c59e5706"
    version "0.0.3"
  
  
    depends_on "node"

    def install
        # 1. 创建一个新目录来存放要安装的文件
        prefix.install Dir['*']

        # 2. 创建一个带有 shebang 的文件，并包含在 mytime.js 中的内容
        File.write("mytime", "#!/usr/bin/env node\n" + File.read("#{prefix}/mytime.js"))

        # 3. 为新创建的 'mytime' 文件添加可执行权限
        chmod 0755, "mytime"

        # 4. 将可执行文件移动到 bin 目录
        bin.install "mytime"
    end

    test do
        assert_equal "现在是", shell_output("#{bin}/mytime").strip[0,3]
    end
  end