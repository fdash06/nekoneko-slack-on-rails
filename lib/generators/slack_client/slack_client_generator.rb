class SlackClientGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_template_file
    template "slack_client.rb", "app/slack_clients/#{file_name}.rb"
  end
end
