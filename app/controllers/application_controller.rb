class ApplicationController < ActionController::Base
  def index
    @host = request.url
    if @host.end_with?("/")
      @host = @host[0...-1] # Remove trailing slash
    end
    @vault_name = ENV["VAULT_NAME"]
  end

  def obsidian
    vault_name = ENV["VAULT_NAME"]
    target = "obsidian://open?vault=#{vault_name}&file=#{params[:path]}"
    redirect_to target, allow_other_host: true
  end
end
