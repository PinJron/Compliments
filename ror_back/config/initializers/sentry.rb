Sentry.init do |config|
  config.dsn = 'https://83ebe0cb6eec4661964bb24f6beff333@glitchtip.development-env.ru/2'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end