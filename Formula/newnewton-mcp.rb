class NewnewtonMcp < Formula
  desc "High-performance Rust MCP server for Newton School of Technology LMS"
  homepage "https://github.com/suwupnil/newNewton"

  head do
    url "https://github.com/suwupnil/newNewton.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/suwupnil/newNewton/releases/download/v1.4.0/newton-mcp-server-v1.4.0-macos-arm64.tar.gz"
      sha256 "47fe007a54a9662488ce2b6aa668fd98fc4b88afdb9c76db91d014b197e595c2" # macos-arm64
    end
    on_intel do
      url "https://github.com/suwupnil/newNewton/releases/download/v1.4.0/newton-mcp-server-v1.4.0-macos-arm64.tar.gz"
      sha256 "47fe007a54a9662488ce2b6aa668fd98fc4b88afdb9c76db91d014b197e595c2" # macos-x86_64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/suwupnil/newNewton/releases/download/v1.4.0/newton-mcp-server-v1.4.0-linux-arm64.tar.gz"
      sha256 "1ad783e923182fa45edb2eaa79313d150e1dd431a477e11ef578e0a9a61ee53a" # linux-arm64
    end
    on_intel do
      url "https://github.com/suwupnil/newNewton/releases/download/v1.4.0/newton-mcp-server-v1.4.0-linux-x86_64.tar.gz"
      sha256 "b7ed48b9492ca533b4d4a5e2007feaeb71103132400cbc47c8913bcb64e9667f" # linux-x86_64
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args(path: "mcp-server")
    else
      bin_name = if File.exist?("newnewton")
        "newnewton"
      elsif File.exist?("newnewton-mcp")
        "newnewton-mcp"
      elsif File.exist?("newton-mcp-server")
        "newton-mcp-server"
      else
        odie "No recognized binary found in archive"
      end
      bin.install bin_name => "newnewton"
    end

    bin.install_symlink bin/"newnewton" => "newnewton-mcp"
    bin.install_symlink bin/"newnewton" => "newton-mcp-server"
  end

  test do
    assert_path_exists bin/"newnewton"
    assert_predicate bin/"newnewton", :executable?
    assert_match "newNewton MCP Server", shell_output("#{bin}/newnewton --version")
  end
end
