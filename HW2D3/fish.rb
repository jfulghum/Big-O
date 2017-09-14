array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(array)
  max_fish = []
  i = 0
  while i < array.length
    if max_fish.length < array[i].length
      max_fish = array[i]
      i + 1
    end
    max_fish
  end
end

class Array
  #this should look familiar
  def dominant_octopus(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    mid = length / 2
    left = take(length/2)
    right = drop(length/2)

    Array.merge(left.dominant_octopus(&prc), right.dominant_octopus(&prc))

end

class Array
  def self.merge(left, right)
    merged = []
    until left.empty? || right.empty?
      case left.first <=> right.first
      when -1
        merged << left.shift
      when 0
        merged << right.shift
      when 1
        merged << right.shift
      end
    end
    merged + left + right

  end
end

def nlogn_biggest_fish(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.dominant_octopus(&prc)[0]
end

def linear_biggest_fish(fishes)
  #hold the biggest fish
  biggest_fish = fishes.first

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      #update the biggest fish
      biggest_fish = fish
    end
  end

  biggest_fish
end 
