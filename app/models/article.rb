class Article < ApplicationRecord
	# Enforce non-null titles and descriptions, and specify
	# min/max lengths for these attributes
	validates :title, presence: true, length: {minimum: 4, maximum: 30}
	validates :description, presence: true, length: {minimum: 6, maximum: 100}
end