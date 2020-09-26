class Subfinder < Formula
  desc "Subdomain discovery tool"
  homepage "https://github.com/projectdiscovery/subfinder"
  url "https://github.com/projectdiscovery/subfinder/archive/v2.4.5.tar.gz"
  sha256 "1adbd9c180f7ca6378796748491e23a808e423268bc61fe63af0206877f0ba68"
  license "MIT"
  head "https://github.com/projectdiscovery/subfinder.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "8092d4af3074c4d0dd45204021b8dff9dd73b25453ef6776d6b22a40e0efc35e" => :catalina
    sha256 "7a2df6832eb5d7e0f135bf4168ef83beacd98ea68829886d6f252396992f5ff2" => :mojave
    sha256 "5443410bb4897eaad801d564850562c70b208b88a54d8865882596af19987fc6" => :high_sierra
  end

  depends_on "go" => :build

  def install
    cd "v2" do
      system "go", "build", *std_go_args, "./cmd/subfinder"
    end
  end

  test do
    assert_match "docs.brew.sh", shell_output("#{bin}/subfinder -d brew.sh")
    assert_predicate testpath/".config/subfinder/config.yaml", :exist?
  end
end
