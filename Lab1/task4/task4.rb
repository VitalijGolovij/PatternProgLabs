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

def val_btw_first_last_max(array)
  first_idx = 0
  last_idx = array.index(array.max)
  first_max = array.min
  last_max = array.min
  array.map.with_index do
     |cur_val, cur_idx|
    if cur_val > last_max
      first_idx = last_idx
      last_idx = cur_idx
      first_max = last_max
      last_max = cur_val
      else if last_max >= cur_val and cur_val >= first_max
             first_idx = cur_idx
           end
    end
  end
  if first_idx > last_idx
    array[last_idx+1...first_idx]
  else
    array[first_idx+1...last_idx]
  end
end

def min_even(array)
  answ = array[0]
  array.each{|val| answ = val if val < answ and (val % 2).zero?}
  answ
end

