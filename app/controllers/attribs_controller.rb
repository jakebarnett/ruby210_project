class AttribsController < ApplicationController
    before_action :set_project
    before_action :set_attrib, only: [:edit, :update, :destroy]
    
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
    
    def edit
    end
    
     def update
        if @attrib.update(attrib_params)
            redirect_to project_path(@project)
        else
            # flash.now[:alert] = 'Task not saved.'
            render :edit
        end
    end
    
    def destroy
        @attrib.destroy
        redirect_to project_path(@project)
    end
    
    
    
    
    private
    
    def set_project
        @project = Project.find(params[:project_id])
    end
    
    def set_attrib
        @attrib = @project.attribs.find([params[:id]]).first
    end
    
     def attrib_params
      params.require(:attrib).permit(:name)
    end
end