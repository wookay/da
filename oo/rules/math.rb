class String
  def eval
    Kernel.eval self
  end
end
print ARGV.to_s.gsub('더하기','+').gsub('빼기','-').eval.to_s
