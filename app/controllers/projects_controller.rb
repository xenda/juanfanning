class ProjectsController < ApplicationController
  
  auto_complete_for :project, :issuer
  
  # def autocomplete_for_project_issuer
  #   @projects = Project.search params[:q]
  # end
  
end
