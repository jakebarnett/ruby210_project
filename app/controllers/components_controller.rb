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
    
    def edit
        @project = Project.find(params[:project_id])
        @component = @project.components.find([params[:id]]).first
    end
    
    def update
        @project = Project.find(params[:project_id])
        @component = @project.components.find([params[:id]]).first
        if @component.update(component_params)
            redirect_to @project
        else
            render :edit
        end
    end
    
    def destroy
        @project = Project.find(params[:project_id])
        @project.components.find([params[:id]]).first.destroy
        redirect_to project_path(@project)
    end
    
    private
    
    def component_params
      params.require(:component).permit(:name)
    end
end