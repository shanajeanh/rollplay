module UserSignInHelper
  def login_with_google(name = "Mira Grant")
    visit auth_path(:google_oauth2)
  end
end
