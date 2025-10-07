# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Exo < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage ""
  url "https://github.com/exo-explore/exo.git",
    using: :git,
    branch: "super_secret_branch"
  version "0.3.0"
  sha256 ""
  license ""

  depends_on "uv" => :build
  depends_on "rustup" => :build
  depends_on "git-lfs" => :build
  depends_on "python@3.13"
  depends_on "macmon"

  def install
    dashboard_dir = share/"dashboard"
    dashboard_dir.mkpath

    cp_r "dashboard/.", share/"dashboard" 

    system "uv", "venv", libexec, "--python", Formula["python@3.13"].opt_bin/"python3.13"
    system "uv", "pip", "install", ".", "--python", libexec/"bin/python", verbose: true

    (bin/"exo").write_env_script libexec/"bin/exo", DASHBOARD_DIR: dashboard_dir
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
