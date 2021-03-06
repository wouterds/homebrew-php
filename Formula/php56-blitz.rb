require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Blitz < AbstractPhp56Extension
  init
  desc "Blitz, the fasted template engine for PHP!"
  homepage "http://alexeyrybak.com/blitz/blitz_en.html"
  url "https://github.com/alexeyrybak/blitz/archive/0.9.1.tar.gz"
  sha256 "f2f9364509bf078e322f1cd8d6d2eece4cb73416a8a987f583464757fce79317"
  head "https://github.com/alexeyrybak/blitz.git"

  bottle do
    root_url "https://homebrew.bintray.com/bottles-php"
    sha256 "76679e3c10363723490a7211c7953e08baf0a581aff1a89646893e57c4db886a" => :yosemite
    sha256 "630e006acdf46ce51cbfe0d10720b392229883efbd83f12f67d40e03f651da47" => :mavericks
    sha256 "1f01274605ffe8d3ab663d27223da569a7764da7e107d487d94d44a8f849797d" => :mountain_lion
  end

  def install
    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/blitz.so"
    write_config_file if build.with? "config-file"
  end

  def config_file
    super + <<-EOS.undent
      blitz.auto_escape=0
      blitz.check_recursion=1
      blitz.comment_close="*/"
      blitz.comment_open="/*"
      blitz.enable_alternative_tags=1
      blitz.enable_callbacks=1
      blitz.enable_comments=0
      blitz.enable_include=1
      blitz.enable_php_callbacks=1
      blitz.lower_case_method_names=1
      blitz.path=""
      blitz.php_callbacks_first=1
      blitz.remove_spaces_around_context_tags=1
      blitz.scope_lookup_limit=0
      blitz.tag_close="}}"
      blitz.tag_close_alt="-->"
      blitz.tag_open="{{"
      blitz.tag_open_alt="<!--"
      blitz.throw_exceptions=0
      blitz.var_prefix="$"
      blitz.warn_context_duplicates=0
    EOS
  end

  test do
    # TODO
  end
end
