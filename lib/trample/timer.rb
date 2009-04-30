module Trample
  module Timer
    def time
      start = Time.now
      yield
      Time.now.to_f - start.to_f
    end
  end
end
