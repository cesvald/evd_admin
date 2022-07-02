class Admin::BaseController < ApplicationController
    inherit_resources

    before_action do
        authorize! :manage, resource_class
    end
end
