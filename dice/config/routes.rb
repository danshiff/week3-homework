Dice::Application.routes.draw do

  get("/dice", {:controller => "dice", :action => "welcome"})
  get("/roll", {:controller => "dice", :action => "roll_dice"})

end
