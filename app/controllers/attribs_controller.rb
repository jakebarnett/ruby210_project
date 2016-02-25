class AttribsController < ApplicationController
    before_action :set_project
    
    def index
        @attribs = @project.attribs.all
    end
    
    def new
         @attrib = @project.attribs.build
    end
    
    def create
        @attrib = @project.attribs.build(attrib_params)
        if @attrib.save
            redirect_to @project
        else
            render :new
        end
    end
    
    private
    def attrib_params
       params.require(:attrib).permit( :name) 
    end
    
    def set_project
        @project = Project.find(params[:project_id])
    end
end