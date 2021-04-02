

class DashPage
    include Capybara::DSL

    def on_dash?
        return page.has_css?(".dashboard")
    end

    def goto_ad_form
        click_button "Criar anúncio"
    end

    def ad_list
       return find(".equipo-list")
    end
end