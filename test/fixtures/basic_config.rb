Trample.configure do |t|
  concurrency 2
  iterations  1
  get "http://google.com"
end
