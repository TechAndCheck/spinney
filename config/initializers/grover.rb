Rails.application.config.after_initialize do
  Grover.configure do |config|
    config.options = {
      full_page: true,
      emulate_media: "screen",
      cache: false,
      timeout: 0, # Timeout in milliseconds; `0` disables timeout entirely,
      wait_until: "load"
    }
  end
end
