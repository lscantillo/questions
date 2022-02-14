# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://ef8cbd1da7804837893ac5a176ab48c4@o1143937.ingest.sentry.io/6205089'
  config.environment = Rails.env
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  config.traces_sampler = lambda do |context|
    true
  end
end
