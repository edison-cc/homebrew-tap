class CursorUsage < Formula
  desc "Menu bar plugin and terminal report for Cursor usage"
  homepage "https://github.com/edison-cc/cursor-usage"
  url "https://github.com/edison-cc/cursor-usage/releases/download/v1.0.0/cursor-usage-1.0.0.tar.gz"
  sha256 "1b6bbf4194a4e56c7fb2ac15028fbdc81527279fe0937c4679629c13a9e3afc5"
  license "MIT"

  depends_on :macos

  def install
    bin.install "generate-report.sh" => "cursor-usage-report"
    pkgshare.install "cursor-usage.5m.sh"
  end

  def caveats
    <<~EOS
      Run cursor-usage-report to print your usage. Cursor must be signed in, and
      Python 3 is provided by the Xcode Command Line Tools (xcode-select --install).

      For SwiftBar setup, see https://github.com/edison-cc/cursor-usage#homebrew
    EOS
  end

  test do
    assert (bin/"cursor-usage-report").executable?
    assert (pkgshare/"cursor-usage.5m.sh").executable?
    system "/bin/bash", "-n", bin/"cursor-usage-report"
    system "/bin/bash", "-n", pkgshare/"cursor-usage.5m.sh"
  end
end
