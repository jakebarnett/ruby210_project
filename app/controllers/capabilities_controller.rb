class CapabilitiesController < ApplicationController
    
    def index
      @capabilities = Capability.all
    end
    
    def new
      @capability = Capability.new
    end
    
    def create
      @capability = Capability.new(capability_params)
      if @capability.save
        redirect_to project_path(@capability.attrib.project), notice: 'Capability successfully created.'
      else
        flash.now[:alert] = 'Capability was not created.'
        render :new
      end
    end
    
    def edit
      @capability = Capability.find(params[:id])
    end
    
    def update
      @capability = Capability.find(params[:id])
      @project = @capability.attrib.project
      if @capability.update(capability_params)
        redirect_to @project, notice: 'Capability successfully updated.'
      else
        flash.now[:alert] = 'Capability not saved.'
        render :edit
      end
    end
    
    def destroy
      @capability = Capability.find(params[:id])
      @project = @capability.attrib.project
      @capability.destroy
      redirect_to project_path(@project), notice: 'Capability successfully deleted.'
    end
    
    private
    
    def capability_params
      params.require(:capability).permit(:attrib_id, :component_id, :name, :description, :passing)
    end
end