class ApplicationController < ActionController::Base
  def set_professors
    @professors = Professor.all
  end

  def set_classes
    @my_classes = MyClass.all
  end
end
