# Re-Implementierung des Getters von Game-Variables
# Wird ben�tigt, um Ranges von Variablen einfach abfragen zu k�nnen
# Liefert einen Array mit den entsprechenden Variablen zur�ck
class Game_Variables
  
  def [](variable_id)
    if variable_id.is_a? Integer
      if variable_id <= 5000 and @data[variable_id] != nil
        return @data[variable_id]
      else
        return 0
      end
    else
      ret_val = []
      for i in variable_id
        next if i == 0
        ret_val << self[i]
      end
      return ret_val
    end
  end
  
end

# Re-Implementierung des Getters von Game-Switches
# Wird ben�tigt, um Ranges von Switches einfach abfragen zu k�nnen
# Liefert einen Array mit den entsprechenden Switches zur�ck
class Game_Switches
  
  def [](switch_id)
    if switch_id.is_a? Integer
      if switch_id <= 5000 and @data[switch_id] != nil
        return @data[switch_id]
      else
        return false
      end
    else
      ret_val = []
      for i in switch_id
        next if i == 0
        ret_val << self[i]
      end
      return ret_val
    end    
  end
  
end