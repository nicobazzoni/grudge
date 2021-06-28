      class PeopleController < ApplicationController
        
        before_action :set_person, only: [:show, :destroy]
      
        def index
          @people = Person.all
        end
      
        def show
        end
      
        def new
          @person = Person.new
          2.times{ @person.enemies.build }
        end
      
        def create
          @person = Person.new(person_params)
          if @person.save
            redirect_to people_path
          else
            3.times{ @person.enemies.build }
            render :new
          end
        end
      
        def destroy
          @person.destroy
          redirect_to people_path
        end
      
        private
      
        def set_person
          @person = Person.find_by(params[:id])
        end
      
        def person_params
          params.require(:person).permit(:name, :reason, enemies_attributes: [:name, :reason, :threat_level, :grudge_id])
        end
      
      
end
