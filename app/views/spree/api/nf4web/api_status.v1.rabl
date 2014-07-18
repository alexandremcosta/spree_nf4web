@status.each do |s, i|
  node(s) { i }
end
