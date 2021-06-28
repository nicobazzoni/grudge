module GrudgesHelper

    def grudge(enemy)
        if enemy.grudge
          render partial: "grudges/grudge", locals: {grudge: enemy.grudge}
        else
          link_to "Edit #{enemy.name} to add a grudge!", edit_enemy_path(enemy)
        end
      end

end