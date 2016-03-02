class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    
    def index
        @projects = Project.all
    end
    
    def new
        @project = Project.new
    end
    
    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to @project, notice: 'Project successfully created.'
        else
            flash.now[:alert] = 'Project was not saved.'
            render :new
        end
    end
    
    def show
        @attribs = @project.attribs.all
        @components = @project.components.all
    end
    
    def edit
    end
    
    def update
        if @project.update(project_params)
            redirect_to @project, notice: 'Project successfully updated.'
        else
            render :edit
        end
    end
    
    def destroy
        @project.destroy
        redirect_to '/projects', notice: 'Project successfully deleted.'
    end
    
    
    private
        def project_params
           params.require(:project)
           .permit( :name, 
                    :description,) 
        end
        
        def set_project
            @project = Project.find(params[:id])
        end
end