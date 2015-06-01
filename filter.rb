module Jekyll
	module Filter
	    def to_array_uniq(str)
    	str.uniq
  		end
	end
end

Liquid::Template.register_filter(Jekyll::Filter)