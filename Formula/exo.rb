# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Exo < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage ""
  url "https://github.com/exo-explore/exo-v2.git",
    using: :git
    tag: "v0.0.1"
  version "0.0.1"
  sha256 ""
  license ""

  depends_on "python@3.13"

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    virtualenv_install_with_resources
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
