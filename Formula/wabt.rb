class Wabt < Formula
  desc "The WebAssembly Binary Toolkit"
  homepage "https://github.com/WebAssembly/wabt"
  url "https://github.com/WebAssembly/wabt/archive/binary_0xd.tar.gz"
  version "12"
  sha256 "76146aaeb404e1d84607f8dfd1f31062216b4d5053dd14c72b3dc6df3aaaad9e"
  head "https://github.com/WebAssembly/wabt.git"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DBUILD_TESTS=OFF"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/wasm2wast", "-h"
  end
end
