module Jekyll
	module MyFilters
		def replaceSpaces(input)
			input.gsub(/ /, '-')
		end
		def category(input)
			Jekyll.configuration({})['categoriesLabels'][replaceSpaces(input)] || input.capitalize()
		end
		def tag(input)
			Jekyll.configuration({})['tagsLabels'][replaceSpaces(input)] || input.capitalize()
		end
	end
end

Liquid::Template.register_filter(Jekyll::MyFilters)