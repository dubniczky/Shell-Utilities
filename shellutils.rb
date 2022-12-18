class Shellutils < Formula
    desc "A custom set of shell utility scripts written in bash"
    homepage "https://github.com/dubniczky/Shell-Utilities"
    url "https://github.com/dubniczky/Shell-Utilities.git", :using => :git, :tag => "1.0.0"
    version "1.0.0"

    # While indiviual scripts may depend on various tools,
    # there is no need for them to be listed here, as they
    # will be checked for in the individual scripts and
    # may not be needed by all developers
    depends_on "bash"

    def install
      bin.install "scripts/embark.sh" => "embark"
      bin.install "scripts/gitid.sh" => "gitid"
      bin.install "scripts/mop.sh" => "mop"
      bin.install "scripts/origin.sh" => "origin"
      bin.install "scripts/packup.sh" => "packup"
      bin.install "scripts/pubs.sh" => "pubs"
      bin.install "scripts/push.sh" => "push"
      bin.install "scripts/rand16.sh" => "rand16"
      bin.install "scripts/rand64.sh" => "rand64"
      bin.install "scripts/sail.sh" => "sail"
      bin.install "scripts/shtart.sh" => "shtart"
      bin.install "scripts/sink.sh" => "sink"
      bin.install "scripts/snek.sh" => "snek"
      bin.install "scripts/venv.sh" => "venv"
    end

    test do
      true
    end
end
