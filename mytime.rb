class Mytime < Formula
    homepage "https://github.com/SmallFishCode/homebrew-mytime"
    url "https://github.com/SmallFishCode/homebrew-mytime/releases/download/v0.0.2/mytime-v0.0.2.tar.gz"
    sha256 "f173a64b2e2317afc77095970b4a8964eeab87c38d9c35331da17af2c59e5706"
    version "0.0.2"
  
  
    def install
        bin.install "mytime"
    end
  
    test do
        system "false"
    end
  end