require 'benchmark'

@short = "tpnews-eml-2015-05-09"
@long = "tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?tpnews-eml-2015-05-09?"


n = 100_000


def use_split
  a = @short.split("?")[0]
  b = @long.split("?")[0]
  return a + "&" + b
end

def use_regex
  a = @short.scan(/(^.*?)(\?|\z)/).last.first
  b = @long.scan(/(^.*?)(\?|\z)/).last.first
  return a + "&" + b
end


Benchmark.bm do |x|
  x.report(:use_split) { n.times { use_split() } }
  x.report(:use_regex) { n.times { use_regex() } }
end
