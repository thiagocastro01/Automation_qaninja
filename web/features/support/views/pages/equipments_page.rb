class Equipments_page
  include Capybara::DSL

  def create(equipment)
    #implicit checkpoint
    #page.have_css?(#equipoForm)

    @thumb = Dir.pwd + "/features/support/fixtures/images/" + equipment[:thumb]
    upload_thumb if equipment[:thumb].length > 0

    find("input[placeholder$=equipamento]").set equipment[:name]
    select_cat(equipment[:category]) if equipment[:category].length > 0
    find("input[placeholder^=Valor]").set equipment[:value]

    click_button "Cadastrar"
  end

  def select_cat(category)
    find("#category").find("option", text: category).select_option
  end

  def upload_thumb
    find("#thumbnail input[type=file]", visible: false).set @thumb
  end
end
