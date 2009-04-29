Trample.configure do |t|
  t.concurrency 2
  t.iterations  1
  t.get "http://google.com"
end
