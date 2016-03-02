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
            redirect_to @project, notice: 'Attribute successfully created.'
        else
            flash.now[:alert] = 'Attribute was not saved.'
            render :new
        end
    end
    
    def edit
    end
    
     def update
        if @attrib.update(attrib_params)
            redirect_to project_path(@project), notice: 'Attribute successfully updated.'
        else
            flash.now[:alert] = 'Attribute not saved.'
            render :edit
        end
    end
    
    def destroy
        @attrib.destroy
        redirect_to project_path(@project), notice: 'Attribute successfully deleted.'
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