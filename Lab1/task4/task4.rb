def idx_desc_order(array)
  return nil if array.nil?
  array.map.with_index { |val, idx| [val, idx] }.sort_by { |val| val[0] }.reverse.map{|val| val[1]}
end

def val_btw_first_two_max(array)
  max_idx1 = array.find_index(array.max)
  tmp_array = array.reject.with_index{|val, idx| idx==max_idx1}
  max_idx2 = tmp_array.find_index(tmp_array.max)
  if max_idx1<=max_idx2 then max_idx2 += 1 end
  array[max_idx1+1...max_idx2]
end


