class Mytime < Formula
    homepage "https://github.com/SmallFishCode/homebrew-mytime"
    url "https://github.com/SmallFishCode/homebrew-mytime/releases/download/v0.0.4/mytime-v0.0.4.tar.gz"
    sha256 "68957750dae15b57034071009d76e0f2a3e44e928eb61dffc5a3de0e58211c37"
    version "0.0.4"

    # url是指向你在GitHub上托管的tarball文件的URL，其中包含了打包好的脚本。你需要创建一个 release 并上传tarball文件，然后将文件的URL放到url字段。请确保遵循语义化版本控制规范时进行版本控制。
    # sha256是你的tarball文件的SHA256哈希值。在终端中运行shasum -a 256 your_tarball以获取哈希值。
  
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