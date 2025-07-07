class EnvChecker
  REQUIRED_VARS = %w[VAULT_NAME]

  def self.check!
    missing = REQUIRED_VARS.select { |var| ENV[var].nil? || ENV[var].empty? }
    unless missing.empty?
      abort("Missing required environment variables: #{missing.join(', ')}")
    end
  end
end
