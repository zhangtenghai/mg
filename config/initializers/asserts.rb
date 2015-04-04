Rails.application.config.assets.precompile << Proc.new do |path|
  if path =~ /\.(css|js|png|woff|eot|svg|ttf|otf)\z/
    full_path = Rails.application.assets.resolve(path).to_path
    app_assets_path = Rails.root.join('app', 'assets').to_path
    vendor_assets_path = Rails.root.join('vendor', 'assets').to_path
    if full_path.starts_with?(app_assets_path) || full_path.starts_with?(vendor_assets_path)
      puts "including asset: " + full_path
      true
    else
      puts "excluding asset: " + full_path
      false
    end
  else
    false
  end
end

Rails.application.config.assets.precompile += %w( ckeditor/* )