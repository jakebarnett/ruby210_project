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
    
    def edit
        @project = Project.find(params[:project_id])
        @attrib = @project.attribs.find([params[:id]]).first
    end
    
    def update
        @project = Project.find(params[:id])
        if @project.update(project_params)
            redirect_to @project
        else
            render :edit
        end
    end
    
     def update
        @project = Project.find(params[:project_id])
        @attrib = @project.attribs.find([params[:id]]).first
        if @attrib.update(attrib_params)
          redirect_to project_path(@project)
        else
        # flash.now[:alert] = 'Task not saved.'
        render :edit
    end
  end
    
    private
    
    def set_project
        @project = Project.find(params[:project_id])
    end
    
     def attrib_params
      params.require(:attrib).permit(:name)
    end
end