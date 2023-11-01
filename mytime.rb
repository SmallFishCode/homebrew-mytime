class Mytime < Formula
    homepage "https://github.com/SmallFishCode/homebrew-mytime"
    url "https://github.com/SmallFishCode/homebrew-mytime/releases/download/v0.0.1/mytime-v0.0.1.tar.gz"
    sha256 "f173a64b2e2317afc77095970b4a8964eeab87c38d9c35331da17af2c59e5706"
    version "0.0.1"
  
    depends_on "node"
  
    def install
        system "npm", "install", *std_npm_install_args(libexec)
        bin.install_symlink Dir["#{libexec}/bin/*"]
      end
  
    test do
      assert_equal "现在是", shell_output("#{bin}/mytime").strip[0,3]
    end
  end