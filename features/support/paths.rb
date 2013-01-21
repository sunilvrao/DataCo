module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step   definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
      when /home page/
        home_index_path
      when /sign up page/
        new_user_registration_path
    end
  end
end