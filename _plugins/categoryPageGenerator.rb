module Jekyll

	class CategoryPage < Page
		def initialize(site, base, dir, category)
			@site = site
			@base = base
			@dir = dir
			@name = 'index.html'

			self.process(@name)
			self.read_yaml(File.join(base, '_layouts'), 'category.html')
			self.data['category'] = category

			label = Jekyll.configuration({})['categoriesLabels'][category.gsub(/ /, '-')]  || category.capitalize()
			self.data['title'] = "Categoria: #{label}"
		end
	end

	class CategoryPageGenerator < Generator
		safe true

		def generate(site)
			if site.layouts.key? 'category'
				dir = 'blog/categories'
				site.categories.each_key do |category|
					folder = category.gsub(/ /, '-')
					site.pages << CategoryPage.new(site, site.source, File.join(dir, folder), category)
				end
			end
		end
	end

end