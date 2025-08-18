# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Exo < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage ""
  url "https://github.com/exo-explore/exo-v2.git",
    using: :git,
    branch: "homebrew"
  sha256 ""
  license ""

  depends_on "uv" => :build
  depends_on "go" => :build
  depends_on "python@3.13"
  depends_on "macmon"

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    forwarder_build_path = libexec/"go_bin"
    forwarder_build_path.mkpath
    forwarder = forwarder_build_path/"forwarder"
    
    cd "networking/forwarder" do
      system "go", "build", "-buildvcs=false", "-o", forwarder_build_path, "."
      chmod 0755, forwarder
    end
    system "uv", "venv", libexec, "--python", Formula["python@3.13"].opt_bin/"python3.13"
    system "uv", "pip", "install", ".", "--python", libexec/"bin/python"

    (bin/"exo-master").write_env_script libexec/"bin/exo-master", FORWARDER_BUILD_PATH: forwarder
    (bin/"exo-worker").write_env_script libexec/"bin/exo-worker", FORWARDER_BUILD_PATH: forwarder
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test exo`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
