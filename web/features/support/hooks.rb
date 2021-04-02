#Executado antes do cenário
Before do
  @signup_page = Signup_page.new
  @alert = Alert.new
  @signin_page = Signin_page.new
  @dash_page = DashPage.new
  @equipments_page = Equipments_page.new

  page.current_window.resize_to(1440, 900)
end

#executado depois do step "Then", depois do fim do cenário

After do
  temp_shot = page.save_screenshot("logs/temp_screenshot.png")

  Allure.add_attachment(
    name: "Screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot),
  )
end
