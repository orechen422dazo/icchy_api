def hi(name)
  puts "hi #{name}"
  # frozen_string_literal: true
end

def loop(val)
  val.each { |v|
    puts v
  }
end
