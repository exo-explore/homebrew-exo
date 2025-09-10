# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ExoDemo < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage ""
  url "https://drive.google.com/uc?export=download&id=1Y1zVWZCWVuC_1TgE06gLILSaaxAbUnuY"
  sha256 "09c4d6efa4177f12d10e386b4f92d818c8233486c768a3810c1edcd7cc970b6e"
  license ""

  depends_on "uv" => :build
  depends_on "python@3.13"
  depends_on "macmon"

  def install
    dashboard_dir = share/"dashboard"
    dashboard_dir.mkpath
    
    ENV["CARGO_HOME"] = buildpath/"cargo_home"
    ENV["RUSTUP_HOME"] = buildpath/"rustup_home"

    cp_r "dashboard/.", share/"dashboard" 

    system "uv", "venv", libexec, "--python", Formula["python@3.13"].opt_bin/"python3.13"
    system "uv", "pip", "install", ".", "--python", libexec/"bin/python"

    (bin/"exo").write_env_script libexec/"bin/exo", DASHBOARD_DIR: dashboard_dir
  end
end
