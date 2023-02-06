def idx_desc_order(array)
  return nil if array.nil?
  puts array.map.with_index { |x, i| [x,i] }.sort_by { |x| x[0] }.reverse.map{|x| x[1]}
end



puts idx_desc_order(a)