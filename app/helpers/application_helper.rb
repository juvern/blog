module ApplicationHelper
	# Returns the full title on a per page basis
	def full_title(page_title)
		base_title = "Hello | Ju-Vern See"
		if page_title.empty?
			base_title
		else
			"#{page_title}"
		end
	end	
end
