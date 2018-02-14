#------------------------------------------------------------------------------
# solidity.rb
#
# Homebrew formula for solidity.  Homebrew (http://brew.sh/) is
# the de-facto standard package manager for OS X, and this Ruby script
# contains the metadata used to map command-line user settings used
# with the 'brew' command onto build options.
#
# Our documentation for the solidity Homebrew setup is at:
#
# http://solidity.readthedocs.io/en/latest/installing-solidity.html
#
# (c) 2014-2017 solidity contributors.
#------------------------------------------------------------------------------

require 'formula'

class Solidity < Formula

  desc "The Solidity Contract-Oriented Programming Language"
  homepage "http://solidity.readthedocs.org"
  url "https://github.com/ethereum/solidity/releases/download/v0.4.20/solidity_0.4.20.tar.gz"
  version "0.4.20"
  sha256 "a6fd83a73920545cd475b4bad2bc51b75af576e2dc54e1b4d3f38c22a7b7d84b"

  depends_on "cmake" => :build
  depends_on "boost" => "c++11"
  depends_on "cryptopp"
  depends_on "gmp"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/solc", "--version"
  end
end
