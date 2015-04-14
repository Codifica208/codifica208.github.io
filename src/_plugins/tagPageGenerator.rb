module Jekyll

	class TagPage < Page
		def initialize(site, base, dir, tag)
			@site = site
			@base = base
			@dir = dir
			@name = 'index.html'

			self.process(@name)
			self.read_yaml(File.join(base, '_layouts'), 'tag.html')
			self.data['tag'] = tag

			label = Jekyll.configuration({})['tagsLabels'][tag.gsub(/ /, '-')]  || tag.capitalize()
			self.data['title'] = "Tag: #{label}"
		end
	end

	class TagPageGenerator < Generator
		safe true

		def generate(site)
			if site.layouts.key? 'tag'
				dir = 'blog/tags'
				site.tags.each_key do |tag|
					folder = tag.gsub(/ /, '-')
					site.pages << TagPage.new(site, site.source, File.join(dir, folder), tag)
				end
			end
		end
	end

end