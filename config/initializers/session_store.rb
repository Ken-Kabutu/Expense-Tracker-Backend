Rails.application.config.session_store :cookie_store,
                                       key: '_Expense-Tracker-Backend_session',
                                       httponly: true,
                                       same_site: :lax
