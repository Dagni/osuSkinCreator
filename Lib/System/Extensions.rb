class String

  def start_with?(str)
    !self.match(/^#{Regexp.escape(str)}/).nil?
  end

  def end_with?(str)
    !self.match(/#{Regexp.escape(str)}$/).nil?
  end
	
	def ensure_extend(str1, str2, extension)
		end_with = end_with?(str1) or end_with?(str2)
		addition = end_with ? "" : extension
		return self + addition
	end
end

class Thread
  
  def call_method(command)
    eval command
  end
  
end

class File

	def File.copy(from, to)
		fr_stream = File.open(from, "rb")
		to_stream = File.open(to, "wb")
		
		to_stream.puts fr_stream.read
		
		fr_stream.close
		to_stream.close
	end
	
end

# Bitmaps, which are bigger than 640 x or 480 y will automatically scaled down to the maximum size.
class Sprite

	alias_method :old_unscaled_bitmap, :bitmap=
	
	def bitmap=(value)
		old_unscaled_bitmap(value)
		sizes = [value.width, value.height]
		
		scale_down_x(sizes[0], 640)
		scale_down_y(sizes[1], 480)
	end
	
	def scale_down_x(size, to)
		return if size <= to
		size = size.to_f
		
    to_big = size - to
		sub_factor = to_big / size
		factor = 1.0 - sub_factor
		
		self.zoom_x = factor
	end
	
	def scale_down_y(size, to)
		return if size <= to
		size = size.to_f
		
    to_big = size - to
		sub_factor = to_big / size
		factor = 1.0 - sub_factor
      
		self.zoom_y = factor
	end
	
	def scale_down_to(width, height)
		sizes = [self.bitmap.width, self.bitmap.height]
		
		scale_down_x(sizes[0], width)
		scale_down_y(sizes[1], height)
	end
	
end

class Bitmap

	def coloring(color)
		for x in 0...self.width
			for y in 0...self.height
				c = get_pixel(x, y)
				c.red = [c.red - color.red, 0].max
				c.green = [c.green - color.green, 0].max
				c.blue = [c.blue - color.blue, 0].max
				set_pixel(x, y, c)
			end
		end
		self
	end
	
	def get_inverted_color
		#raise ArgumentError, "use stub for this operation!"
		r = 0
		g = 0
		b = 0
		px = 0
		w = self.width
		h = self.height
		for x in 0...w
			for y in 0...h
				c = get_pixel(x, y)
				r += c.red
				g += c.green
				b += c.blue
				px += 1
			end
			#h = [h-1, 0].max
			w = [w-1, 0].max
		end
		r /= px
		g /= px
		b /= px
		Color.new(255 - r, 255 - g, 255 - b)
	end

end

class InfoBox_Collection < Hash
	private_class_method :new
	private :[]=
	private :delete
	
	@@inst = nil
	
	def InfoBox_Collection.instance(*args, &block)
		@@inst = new(*args, &block) if @@inst.nil?
		@@inst
	end
	
	def add(element)
		return if !element.is_a?(Sprite) && !element.is_a?(Rect)
		self[element.key] = element
	end
	
	def destroy(key)
		return if key.nil?
		if has_key?(key)
			box = self[key].box
			unless box.nil?
				box.dispose unless box.disposed?
			end
			delete(key)
		end
	end
	
end

# Sprites could have a infobox
class Sprite

	attr_reader :info
	attr_reader :box
	attr_reader :key
	
	def add_info_text(*args)
		infos = case args.size
			when 0
				nil
			when 1
				[args[0]]
			else
				[args[0], args[1]]
		end
		return if infos.nil?
		
		infos.each_index { |inf|
			length = [100, infos[inf].length].min
			infos[inf] = infos[inf][0...length]
		}
		
		@key = "#{rand(1000000).to_s}"
		@info = infos
		@box = HelpPopup.new(@info, self)
	end
	
	def has_info_text?
		!@key.nil?
	end
	
	alias_method :jrgcbfexkndjnfxgiz_dispose, :dispose
	def dispose
		InfoBox_Collection.instance.destroy(@key)
		jrgcbfexkndjnfxgiz_dispose
	end
	
end

# Rects could have a infobox
class Rect

	attr_reader :info
	attr_reader :box
	attr_reader :key
	
	def add_info_text(*args)
		infos = case args.size
			when 0
				nil
			when 1
				[args[0]]
			else
				[args[0], args[1]]
		end
		return if infos.nil?
		
		infos.each_index { |inf|
			length = [100, infos[inf].length].min
			infos[inf] = infos[inf][0...length]
		}
		
		@key = "#{rand(1000000).to_s}"
		@info = infos
		@box = HelpPopup.new(@info, self)
	end
	
	def has_info_text?
		!@key.nil?
	end
	
	def dispose
		InfoBox_Collection.instance.destroy(@key)
	end
	
end

class Object

	def puts_self
		puts "\nobject puttet... object #{self.inspect}:\n"
		
		@inner = 1
		inspect_inner(self)
	end
	
	def inspect_inner(obj, inner=1)
		instances = obj.instance_variables
		instances.each { |object|
			val = obj.instance_variable_get(object)
			puts "#{("  " * inner)}#{object}(#{val.class.name}): #{val.inspect}"
			unless val.is_a? String
				@inner += 1
				inspect_inner(val, inner)
				@inner -= 1
			end
		}
	end
	
	def usr_stdout?(flag=false)
		flag or !($DEBUG || FileTest.exist?($running_from + "/Debug"))
	end
	
	alias_method :old_unsignet_print, :print
	def print(*args)
		old_unsignet_print(*args) if usr_stdout?($___print)
		puts "\nredirect print:\n"
		puts *args
	end
	
	alias_method :old_unsignet_p, :p
	def p(*args)
		old_unsignet_p(*args) if usr_stdout?($___p)
		puts "\nredirect p:\n"
		puts *args
	end
	
	alias_method :old_unsignet_puts, :puts
	def puts(*args)
		return if !($DEBUG || FileTest.exist?($running_from + "/Debug"))
		old_unsignet_puts(*args)
	end
	
end