# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ExoDemo < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage ""
  url = "https://drive.google.com/uc?export=download&id=1Y1zVWZCWVuC_1TgE06gLILSaaxAbUnuY"
  sha256 "e93b1a1b3d315aea81f53d567c6c529c8e91defe"
  license ""

  depends_on "uv" => :build
  depends_on "python@3.13"
  depends_on "macmon"

  def install
    dashboard_dir = share/"dashboard"
    dashboard_dir.mkpath

    cp_r "dashboard/.", share/"dashboard" 

    system "uv", "venv", libexec, "--python", Formula["python@3.13"].opt_bin/"python3.13"
    system "uv", "pip", "install", ".", "--python", libexec/"bin/python"

    (bin/"exo").write_env_script libexec/"bin/exo", DASHBOARD_DIR: dashboard_dir
  end
end
