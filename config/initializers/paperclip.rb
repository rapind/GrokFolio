# path where image magic is installed
Paperclip.options[:command_path] = "/usr/local/bin"

Paperclip.interpolates :project_id do |attachment, style|
  attachment.instance.project_id
end
