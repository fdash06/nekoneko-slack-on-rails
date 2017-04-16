module NekonekoSlackOnRails
  class Railtie < Rails::Railtie

    initializer 'Initialize NekonekoSlackOnRails' do |app|
      Dir.glob("#{Rails.root}/app/slack_clients/*.rb").each do |client_file|
        classname = File.basename(client_file, ".rb").classify

        # e.g. SANDWICH_SLACK_TOKEN
        token = ENV["#{classname.upcase}_SLACK_TOKEN"]

        if token.present?
          klass = classname.constantize
          client = klass.new(token: token)
          client.start_async
        else
          Rails.logger.warn "ENV[\"#{classname.upcase}_SLACK_TOKEN\"] is required." 
        end
      end
    end
  end
end

