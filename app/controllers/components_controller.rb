class ComponentsController < ApplicationController
    before_action :set_project
    before_action :set_component, only: [:edit, :update, :destroy]

    
    def index
        @components = @project.components.all
    end
    
    def new
        @component = @project.components.build
    end
    
    def create
        @component = @project.components.build(component_params)
        if @component.save
            redirect_to @project
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @component.update(component_params)
            redirect_to @project
        else
            render :edit
        end
    end
    
    def destroy
        @component.destroy
        redirect_to project_path(@project)
    end
    
    
    
    
    private
    
    def set_project
        @project = Project.find(params[:project_id])
    end
    
    def set_component
        @component = @project.components.find([params[:id]]).first
    end
    
    def component_params
      params.require(:component).permit(:name)
    end
end