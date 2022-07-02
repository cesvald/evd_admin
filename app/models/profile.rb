class Profile < ApplicationRecord
    acts_as_paranoid

    [:admin].each do |name|
		define_singleton_method name do
			Profile.where(name: name).first
		end
	end
end
