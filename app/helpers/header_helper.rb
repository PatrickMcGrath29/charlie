module HeaderHelper
  def session_account_button
    if user_signed_in?
      link_to t("nav.logout"), destroy_user_session_path, method: :delete, class: "button"
    else
      link_to t("nav.login"), new_user_session_path, class: "button"
    end
  end
end
