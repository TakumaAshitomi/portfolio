module LoginMacro
  def login(user)
    user.confirm
    login_as(user)
  end
end