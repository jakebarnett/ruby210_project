class ComponentsController < ApplicationController
    
    def index
        @project = Project.find(params[:project_id])
        @components = @project.components.all
    end
    
    def new
        @project = Project.find(params[:project_id])
        @component = @project.components.build
    end
    
    def create
        @project = Project.find(params[:project_id])
        @component = @project.components.build(component_params)
        if @component.save
            redirect_to @project
        else
            render :new
        end
    end
    
    private
    
    def component_params
      params.require(:component).permit(:name)
    end
end